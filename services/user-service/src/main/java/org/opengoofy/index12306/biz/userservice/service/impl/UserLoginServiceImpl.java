/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.opengoofy.index12306.biz.userservice.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.opengoofy.index12306.biz.userservice.common.enums.UserChainMarkEnum;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserDO;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserDeletionDO;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserMailDO;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserPhoneDO;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserReuseDO;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserDeletionMapper;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserMailMapper;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserMapper;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserPhoneMapper;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserReuseMapper;
import org.opengoofy.index12306.biz.userservice.dto.req.UserDeletionReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.req.UserLoginReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.req.UserRegisterReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.UserLoginRespDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.UserQueryRespDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.UserRegisterRespDTO;
import org.opengoofy.index12306.biz.userservice.service.UserLoginService;
import org.opengoofy.index12306.biz.userservice.service.UserService;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.common.toolkit.BeanUtil;
import org.opengoofy.index12306.framework.starter.convention.exception.ClientException;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.opengoofy.index12306.framework.starter.designpattern.chain.AbstractChainContext;
import org.opengoofy.index12306.frameworks.starter.user.core.UserContext;
import org.opengoofy.index12306.frameworks.starter.user.core.UserInfoDTO;
import org.opengoofy.index12306.frameworks.starter.user.toolkit.JWTUtil;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import static org.opengoofy.index12306.biz.userservice.common.constant.RedisKeyConstant.LOCK_USER_REGISTER;
import static org.opengoofy.index12306.biz.userservice.common.constant.RedisKeyConstant.USER_DELETION;
import static org.opengoofy.index12306.biz.userservice.common.constant.RedisKeyConstant.USER_REGISTER_REUSE_SHARDING;
import static org.opengoofy.index12306.biz.userservice.common.enums.UserRegisterErrorCodeEnum.HAS_USERNAME_NOTNULL;
import static org.opengoofy.index12306.biz.userservice.common.enums.UserRegisterErrorCodeEnum.MAIL_REGISTERED;
import static org.opengoofy.index12306.biz.userservice.common.enums.UserRegisterErrorCodeEnum.PHONE_REGISTERED;
import static org.opengoofy.index12306.biz.userservice.common.enums.UserRegisterErrorCodeEnum.USER_REGISTER_FAIL;
import static org.opengoofy.index12306.biz.userservice.toolkit.UserReuseUtil.hashShardingIdx;

/**
 * 用户登录接口实现
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserLoginServiceImpl implements UserLoginService {

    private final UserService userService;
    private final UserMapper userMapper;
    private final UserReuseMapper userReuseMapper;
    private final UserDeletionMapper userDeletionMapper;
    private final UserPhoneMapper userPhoneMapper;
    private final UserMailMapper userMailMapper;
    private final RedissonClient redissonClient;
    private final DistributedCache distributedCache;
    private final AbstractChainContext<UserRegisterReqDTO> abstractChainContext;
    private final RBloomFilter<String> userRegisterCachePenetrationBloomFilter;
    /*
     * 基于128位Hash的布隆过滤器 -- 用于解决用户注册时缓存穿透的布隆过滤器
     * - 缓存穿透：查询一个缓存中和数据库中都不存在的数据
     * - 缓存穿透的主要解决方案：a.缓存空对象（浪费空间&&数据不一致） / b.BloomFilter / c.Redis Set（内存开销太大） / d.分布式锁(用户注册高峰期拥挤现象，用户体验差)
     * -- 1. BloomFilter的优点：
     * --- (0) 总的来说，相比于其他数据结构，BloomFilter在时间和空间上都有巨大的优势
     * ---  其存储空间和插入/查询时间都是常数O(k)，空间复杂度为O(m)，不会随着元素增加而增加，占用空间少
     * ---  BloomFilter不需要存储元素本身，在某些对保密要求非常严格的场景有优势(全量存储但是不存储数据本身)
     * --- (1) 相比于HashMap：HashMap本质上是一个指针数组，在64bit系统上是64bit的开销，如果采用拉链法处理冲突，则又需要额外的开销
     * ---  返回可能存在的情况中，如果允许有1%的错误率的话，每个元素大约需要10bit的存储空间，整个存储空间的开销大约是hashmap的15%左右
     * --- (2) 相比于Set：如果采用hashmap方式实现，情况同上；如果采用平衡树方式实现，一个节点需要一个指针存储数据的位置，两个指针指向其子
     * ---  节点，因此开销相对于hashmap来讲是更多的
     * --- (3) 相比于bit array：对于某个元素是否存在，先对元素做hash，取模定位到具体的bit，如果该bit为1，则返回元素存在，
     * ---  如果该bit为0，则返回此元素不存在。可以看出，在返回元素存在的时候，也是会有误判的，
     * ---  如果要获得和BloomFilter相同的误判率，则需要比BloomFilter更大的存储空间
     * -- 2. BloomFilter的缺点：
     * --- (1) 存在误判可能：布隆过滤器认为存在的不一定存在；但是布隆过滤器认为不存在的一定不存在
     * --- (2) 删除元素较麻烦(原则上BloomFilter不允许删除元素)，这样会导致其中的无效元素越来越多，实际磁盘中已经删除的元素，BloomFilter依然认为存在，
     * ---  这会造成越来越多的false positive
     */


    @Override
    public UserLoginRespDTO login(UserLoginReqDTO requestParam) {
        String usernameOrMailOrPhone = requestParam.getUsernameOrMailOrPhone();
        // 判断是否通过mail的方式注册，mail方式注册的用户最显著的特征是含有"@"
        boolean mailFlag = false;
        // 时间复杂度最佳 O(1)。indexOf or contains 时间复杂度为 O(n)
        for (char c : usernameOrMailOrPhone.toCharArray()) {
            if (c == '@') {
                mailFlag = true;
                break;
            }
        }

        // 获取username，mail/phone登录都需要获取username信息
        String username;
        if (mailFlag) {
            // 如果是通过mail方式登录的，通过queryWrapper的方式找出
            LambdaQueryWrapper<UserMailDO> queryWrapper = Wrappers.lambdaQuery(UserMailDO.class)
                    .eq(UserMailDO::getMail, usernameOrMailOrPhone);
            username = Optional.ofNullable(userMailMapper.selectOne(queryWrapper))
                    .map(UserMailDO::getUsername)
                    .orElseThrow(() -> new ClientException("用户名/手机号/邮箱不存在"));
        } else {
            // 如果是通过phone方式登录的，通过queryWrapper的方式找出
            LambdaQueryWrapper<UserPhoneDO> queryWrapper = Wrappers.lambdaQuery(UserPhoneDO.class)
                    .eq(UserPhoneDO::getPhone, usernameOrMailOrPhone);
            username = Optional.ofNullable(userPhoneMapper.selectOne(queryWrapper))
                    .map(UserPhoneDO::getUsername)
                    .orElse(null);
        }
        username = Optional.ofNullable(username).orElse(requestParam.getUsernameOrMailOrPhone());
        LambdaQueryWrapper<UserDO> queryWrapper = Wrappers.lambdaQuery(UserDO.class)
                .eq(UserDO::getUsername, username)
                .eq(UserDO::getPassword, requestParam.getPassword())
                .select(UserDO::getId, UserDO::getUsername, UserDO::getRealName);
        UserDO userDO = userMapper.selectOne(queryWrapper);
        if (userDO != null) {
            UserInfoDTO userInfo = UserInfoDTO.builder()
                    .userId(String.valueOf(userDO.getId()))
                    .username(userDO.getUsername())
                    .realName(userDO.getRealName())
                    .build();
            // 生成token
            String accessToken = JWTUtil.generateAccessToken(userInfo);
            UserLoginRespDTO actual = new UserLoginRespDTO(
                    userInfo.getUserId(),
                    requestParam.getUsernameOrMailOrPhone(),
                    userDO.getRealName(), accessToken
            );
            // 将actual+token放入分布式缓存，设置过期时间为30分钟
            distributedCache.put(accessToken, JSON.toJSONString(actual), 30, TimeUnit.MINUTES);
            return actual;
        }
        throw new ServiceException("账号不存在或密码错误");
    }

    @Override
    public UserLoginRespDTO checkLogin(String accessToken) {
        // 如果用户已经登录且未过期，则分布式缓存中一定存在accessToken
        return distributedCache.get(accessToken, UserLoginRespDTO.class);
    }

    @Override
    public void logout(String accessToken) {
        // 用户登出只需要在分布式缓存中删除accessToken
        if (StrUtil.isNotBlank(accessToken)) {
            distributedCache.delete(accessToken);
        }
    }

    @Override
    public Boolean hasUsername(String username) {
        /*
         通过加一层 Redis Set缓存，解决布隆过滤器无法进行删除的问题
         假设我们有一条用户名为 "Hamburger" 的数据，注册后是如何不被重复注册，以及注销后又是如何能被再次使用的。
         -- 1.用户名 "Hamburger" 成功注册后，将其添加至布隆过滤器。
         -- 2.当其他用户查询"Hamburger"是否已被使用时，首先检查布隆过滤器是否包含该用户名。
         -- 3. 如果布隆过滤器中不存在该用户名，根据布隆过滤器的特点，可以确认该用户名一定没有被使用过，因此返回成功，证明该用户名可用。
         -- 4. 如果布隆过滤器中存在该用户名，进一步检查 Redis Set结构中是否包含该用户名。如果存在，表示该用户名已被注销，同样可被再次使用。
         -- 5. 如果布隆过滤器中存在该用户名，但 Redis Set结构中不存在，说明该用户名已被使用且尚未被注销，因此不可用。
         */
        boolean hasUsername = userRegisterCachePenetrationBloomFilter.contains(username);
        if (hasUsername) {
            /*
             * BloomFilter无法删除，因此在BloomFilter和Database之间，使用Redis Set数据结构，保存"已注销的username"
             * 即如果用户注销，则会放入该Set缓存结构中，当查询Redis Set中存在username时，表示username可以进行复用
             */
            StringRedisTemplate instance = (StringRedisTemplate) distributedCache.getInstance();

            /*
             * 但是上面这种方式依然存在以下问题：如果用户频繁申请账号再注销，可能导致用户注销可复用的username Redis Set结构变得庞大，
             * 增加了存储和查询的负担，因此，为了防止这种情况，采取以下方式进行解决：
             * -- 1. 异常行为限制：{@link  UserRegisterCheckDeletionChainHandler}
             * --   每次用户注销时，记录用户的证件号，并限制证件号仅可用于注销5次。超过这个限制的次数，将禁止该证件号再次用于注册账号。
             * -- 2. 缓存分片处理：{@link  UserReuseUtil#hashShardingIdx(String)}
             * --   对 Username Redis Set 结构进行分片。即使我们对异常行为进行了限制，如果有大量用户注销账户，
             * --   存储这些数据在一个 Redis Set 结构中可能成为一个灾难，可能出现 Redis 大 Key 问题。因此，我将 Set 结构进行分片，
             * --   根据用户名的 HashCode 进行取模操作，将数据分散存储在 1024 个 Set 结构中，从而有效地解决了这个问题。
             */

            // BloomFilter中有 且 RedisSet中也有 --> 说明之前用过但已注销，目前可以使用
            // BloomFilter中有 但 RedisSet中没有 --> 说明之前用过且现在依然再用，目前不可以使用
            // stringRedisTemplate.opsForSet().isMember("",""); // 根据key查看集合中是否存在指定数据
            return instance.opsForSet().isMember(USER_REGISTER_REUSE_SHARDING + hashShardingIdx(username), username);
        }
        // BloomFilter中没有，则说明之前一定从未使用过，目前可以使用
        return true;
    }

    // 同时写几个表，因此要用@Transactional事务注解
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UserRegisterRespDTO register(UserRegisterReqDTO requestParam) {
        // 责任链模式：验证注册用户请求参数是否合规
        // 0：用户名必填参数校验
        // 1：用户名唯一性校验
        // 2：用户注册证件号是否多次注销
        abstractChainContext.handler(UserChainMarkEnum.USER_REGISTER_FILTER.name(), requestParam);
        // RLock：基于Redis实现的可重入锁
        // 用户注册锁：对username加锁
        RLock lock = redissonClient.getLock(LOCK_USER_REGISTER + requestParam.getUsername());
        boolean tryLock = lock.tryLock();
        if (!tryLock) {
            // 获取锁失败，则说明该username已经被别人加锁，说明"用户名已存在"
            throw new ServiceException(HAS_USERNAME_NOTNULL);
        }
        try {
            try {
                // 注册用户信息 inserted：插入记录数
                int inserted = userMapper.insert(BeanUtil.convert(requestParam, UserDO.class));
                if (inserted < 1) {
                    // 插入小于1条记录，说明插入失败，抛出"用户注册失败"异常
                    throw new ServiceException(USER_REGISTER_FAIL);
                }
            } catch (DuplicateKeyException dke) {
                // DuplicateKeyException：尝试插入或更新数据导致违反主键或唯一性约束时引发的异常
                log.error("用户名 [{}] 重复注册", requestParam.getUsername());
                // 用户重复注册，抛出"用户名已存在"异常
                throw new ServiceException(HAS_USERNAME_NOTNULL);
            }
            UserPhoneDO userPhoneDO = UserPhoneDO.builder()
                    .phone(requestParam.getPhone())
                    .username(requestParam.getUsername())
                    .build();
            try {
                // 注册用户手机号信息
                userPhoneMapper.insert(userPhoneDO);
            } catch (DuplicateKeyException dke) {
                log.error("用户 [{}] 注册手机号 [{}] 重复", requestParam.getUsername(), requestParam.getPhone());
                // 用户手机号已存在，返回"手机号已被占用"
                throw new ServiceException(PHONE_REGISTERED);
            }
            /*
             * 同时写UserMailMapper和UserPhoneMapper的原因：
             * UserMail表和UserPhone表是两个路由表，分库分表中，我们是通过用户名进行分片的。因此，如果在查询用户信息时不带用户名，
             * 将会触发读扩散问题(由于登录时没有带用户名，导致无法确定用户的分片键，使得系统无法直接锁定用户的数据位于哪个数据库或者
             * 哪张表中。为了找到用户的数据，只能对全部的数据库和表进行扫描查询)
             *
             * 路由表缺点：
             * -- 查询性能：在进行用户登录或其他需要根据分片键查找数据的操作时，需要先访问路由表，根据分片键的取值范围定位到对应的分片位置，
             *  然后再去实际的分片库和分片表中查询数据。这样的查询过程会引入额外的查询开销，可能影响系统的查询性能
             * -- 维护成本：随着系统数据量的增加和业务发展，路由表的大小和复杂度可能会不断增加，维护路由表将会变得越来越复杂。
             *  对于大规模分库分表系统，路由表的维护成本可能会很高
             *
             */
            if (StrUtil.isNotBlank(requestParam.getMail())) {
                UserMailDO userMailDO = UserMailDO.builder()
                        .mail(requestParam.getMail())
                        .username(requestParam.getUsername())
                        .build();
                try {
                    // 注册用户的邮箱信息
                    userMailMapper.insert(userMailDO);
                } catch (DuplicateKeyException dke) {
                    log.error("用户 [{}] 注册邮箱 [{}] 重复", requestParam.getUsername(), requestParam.getMail());
                    throw new ServiceException(MAIL_REGISTERED);
                }
            }
            String username = requestParam.getUsername();
            // 此时这个username已经被注册，那么该username已经不可以被复用，通过userReuseMapper删除用户可复用数据
            userReuseMapper.delete(Wrappers.update(new UserReuseDO(username)));
            // 在Redis Set中也需要删除掉username(Redis Set中存在表示其可以被复用)，防止其被复用造成冲突，在分布式缓存中删除可复用数据
            StringRedisTemplate instance = (StringRedisTemplate) distributedCache.getInstance();
            instance.opsForSet().remove(USER_REGISTER_REUSE_SHARDING + hashShardingIdx(username), username);

            /*
             * BloomFilter设计问题：设置多大、碰撞率以及初始容量不够了怎么办？详情查看：https://nageoffer.com/12306/question
             * 1. 导致布隆过滤器查询碰撞误判问题的原因
             * - 哈希碰撞：布隆过滤器使用多个哈希函数将一个元素映射到多个位置。在极少数情况下，不同元素可能会映射到相同位置导致误判
             * - 过滤器容量不足：如果过滤器容量设置的不够大，会增加误判的可能性；过小的容量可能会导致哈希冲突的增多，增加误判率
             * - 删除操作：Redis的布隆过滤器不支持删除操作，一旦一个元素被添加，就无法从布隆过滤器中删除。如果需要删除，可能会导致一些误判
             * - 误判率设置不合理：布隆过滤器的误判率是可以通过合适的参数设置进行调节的，如果误判率设置得过高，可能会导致误判问题
             * - 业务场景要求高准确性：如果业务场景对准确性要求极高，布隆过滤器可能不是最合适的选择，应该考虑其他更准确的数据结构或算法
             * 2. 布隆过滤器实战 ———— 容量&碰撞率评估
             * - 容量评估：12306与淘宝对比
             *  淘宝商城在第一年做业务时，因为没有往年相关数据作为参考，因此可能很难预估订单量；12306比较好预估（人口数，十亿级别）
             * - 碰撞率评估：布隆过滤器可以设置碰撞率，这个碰撞率可以在非常低的范围内，例如0.1%甚至更低；但这本质上是一个空间和重复碰撞的博弈
             *  希望占用空间小，那么就尽可能让碰撞率高；希望碰撞率低，则需要把空间调大
             * 3. 初始容量评估不够用怎么办 Question：随着国内人口越来越多，之前评估的布隆过滤器容量不够了应该怎么办
             * - 我们可以有个定时任务，每一段时间统计和布隆过滤器的预期差值有多少。当已注册人数达到布隆过滤器数量的一个触发阈值（比如80%）时，
             *  通过后台任务重建布隆过滤器
             */

            // 将用户数据添加到BloomFilter中
            userRegisterCachePenetrationBloomFilter.add(username);
        } finally {
            lock.unlock();
        }
        return BeanUtil.convert(requestParam, UserRegisterRespDTO.class);
    }

    // 同时写几个表，因此要用@Transactional事务注解
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deletion(UserDeletionReqDTO requestParam) {
        String username = UserContext.getUsername();
        if (!Objects.equals(username, requestParam.getUsername())) {
            // 此处严谨来说，需要上报风控中心进行异常检测
            throw new ClientException("注销账号与登录账号不一致");
        }
        // 用户注销锁，对username加锁
        RLock lock = redissonClient.getLock(USER_DELETION + requestParam.getUsername());
        // 加锁为什么放在 try 语句外？https://www.yuque.com/magestack/12306/pu52u29i6eb1c5wh
        lock.lock();
        try {
            UserQueryRespDTO userQueryRespDTO = userService.queryUserByUsername(username);
            UserDeletionDO userDeletionDO = UserDeletionDO.builder()
                    .idType(userQueryRespDTO.getIdType())
                    .idCard(userQueryRespDTO.getIdCard())
                    .build();
            userDeletionMapper.insert(userDeletionDO);
            UserDO userDO = new UserDO();
            userDO.setDeletionTime(System.currentTimeMillis());
            userDO.setUsername(username);
            // MyBatis Plus 不支持修改语句变更 del_flag 字段
            userMapper.deletionUser(userDO);
            UserPhoneDO userPhoneDO = UserPhoneDO.builder()
                    .phone(userQueryRespDTO.getPhone())
                    .deletionTime(System.currentTimeMillis())
                    .build();
            userPhoneMapper.deletionUser(userPhoneDO);
            if (StrUtil.isNotBlank(userQueryRespDTO.getMail())) {
                UserMailDO userMailDO = UserMailDO.builder()
                        .mail(userQueryRespDTO.getMail())
                        .deletionTime(System.currentTimeMillis())
                        .build();
                userMailMapper.deletionUser(userMailDO);
            }

            // username的复用性构建过程
            distributedCache.delete(UserContext.getToken());
            userReuseMapper.insert(new UserReuseDO(username));
            StringRedisTemplate instance = (StringRedisTemplate) distributedCache.getInstance();
            instance.opsForSet().add(USER_REGISTER_REUSE_SHARDING + hashShardingIdx(username), username);
        } finally {
            lock.unlock();
        }
    }
}
