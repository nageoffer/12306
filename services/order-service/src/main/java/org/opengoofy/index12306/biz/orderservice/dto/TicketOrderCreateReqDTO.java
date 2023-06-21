package org.opengoofy.index12306.biz.orderservice.dto;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 车票订单创建请求参数
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
public class TicketOrderCreateReqDTO {

    /**
     * 用户名
     */
    private String username;

    /**
     * 车次 ID
     */
    private Long trainId;

    /**
     * 出发站点
     */
    private String departure;

    /**
     * 到达站点
     */
    private String arrival;

    /**
     * 订单来源
     */
    private Integer source;

    /**
     * 下单时间
     */
    private Date orderTime;

    /**
     * 订单明细
     */
    private List<TicketOrderItemCreateReqDTO> ticketOrderItems;
}
