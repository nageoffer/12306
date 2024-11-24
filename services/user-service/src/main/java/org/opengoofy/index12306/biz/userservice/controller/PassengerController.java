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

package org.opengoofy.index12306.biz.userservice.controller;

import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.userservice.dto.req.PassengerRemoveReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.req.PassengerReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.PassengerActualRespDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.PassengerRespDTO;
import org.opengoofy.index12306.biz.userservice.service.PassengerService;
import org.opengoofy.index12306.framework.starter.convention.result.Result;
import org.opengoofy.index12306.framework.starter.idempotent.annotation.Idempotent;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentSceneEnum;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentTypeEnum;
import org.opengoofy.index12306.framework.starter.web.Results;
import org.opengoofy.index12306.frameworks.starter.user.core.UserContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 乘车人控制层
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RestController
@RequiredArgsConstructor
public class PassengerController {

    private final PassengerService passengerService;

    /**
     * 根据用户名查询乘车人列表
     */
    @GetMapping("/api/user-service/passenger/query")
    public Result<List<PassengerRespDTO>> listPassengerQueryByUsername() {
        return Results.success(passengerService.listPassengerQueryByUsername(UserContext.getUsername()));
    }

    /**
     * 根据乘车人 ID 集合查询乘车人列表
     */
    @GetMapping("/api/user-service/inner/passenger/actual/query/ids")
    public Result<List<PassengerActualRespDTO>> listPassengerQueryByIds(@RequestParam("username") String username, @RequestParam("ids") List<Long> ids) {
        return Results.success(passengerService.listPassengerQueryByIds(username, ids));
    }

    /**
     * 新增乘车人
     */
    @Idempotent(
            uniqueKeyPrefix = "index12306-user:lock_passenger-alter:",
            key = "T(org.opengoofy.index12306.frameworks.starter.user.core.UserContext).getUsername()",
            type = IdempotentTypeEnum.SPEL,
            scene = IdempotentSceneEnum.RESTAPI,
            message = "正在新增乘车人，请稍后再试..."
    )
    @PostMapping("/api/user-service/passenger/save")
    public Result<Void> savePassenger(@RequestBody PassengerReqDTO requestParam) {
        passengerService.savePassenger(requestParam);
        return Results.success();
    }

    /**
     * 修改乘车人
     */
    @Idempotent(
            uniqueKeyPrefix = "index12306-user:lock_passenger-alter:",
            key = "T(org.opengoofy.index12306.frameworks.starter.user.core.UserContext).getUsername()",
            type = IdempotentTypeEnum.SPEL,
            scene = IdempotentSceneEnum.RESTAPI,
            message = "正在修改乘车人，请稍后再试..."
    )
    @PostMapping("/api/user-service/passenger/update")
    public Result<Void> updatePassenger(@RequestBody PassengerReqDTO requestParam) {
        passengerService.updatePassenger(requestParam);
        return Results.success();
    }

    /**
     * 移除乘车人
     */
    @PostMapping("/api/user-service/passenger/remove")
    public Result<Void> removePassenger(@RequestBody PassengerRemoveReqDTO requestParam) {
        passengerService.removePassenger(requestParam);
        return Results.success();
    }
}
