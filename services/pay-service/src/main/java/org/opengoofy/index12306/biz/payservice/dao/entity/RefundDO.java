package org.opengoofy.index12306.biz.payservice.dao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Builder;
import lombok.Data;
import org.opengoofy.index12306.framework.starter.database.base.BaseDO;

import java.util.Date;

/**
 * 退款记录实体
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
@TableName("t_refund")
public class RefundDO extends BaseDO {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 支付流水号
     */
    private String paySn;

    /**
     * 订单号
     */
    private String orderSn;

    /**
     * 三方交易凭证号
     */
    private String tradeNo;

    /**
     * 退款金额
     */
    private Integer amount;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 列车ID
     */
    private Long trainId;

    /**
     * 列车车次
     */
    private String trainNumber;

    /**
     * 乘车日期
     */
    private Date ridingDate;

    /**
     * 出发站点
     */
    private String departure;

    /**
     * 到达站点
     */
    private String arrival;

    /**
     * 出发时间
     */
    private Date departureTime;

    /**
     * 到达时间
     */
    private Date arrivalTime;

    /**
     * 座位类型
     */
    private Integer seatType;

    /**
     * 证件类型
     */
    private Integer idType;

    /**
     * 证件号
     */
    private String idCard;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 订单状态
     */
    private Integer status;

    /**
     * 退款时间
     */
    private Date refundTime;
}
