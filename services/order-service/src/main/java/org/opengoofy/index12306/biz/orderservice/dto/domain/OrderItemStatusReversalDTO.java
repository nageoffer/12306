package org.opengoofy.index12306.biz.orderservice.dto.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.opengoofy.index12306.biz.orderservice.dao.entity.OrderItemDO;

import java.util.List;

/**
 * 子订单状态反转实体
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemStatusReversalDTO {

    /**
     * 订单号
     */
    private String orderSn;
    /**
     * 订单反转后状态
     */
    private Integer orderStatus;

    /**
     * 订单明细反转后状态
     */
    private Integer orderItemStatus;

    /**
     * 订单明细集合
     */
    private List<OrderItemDO> orderItemDOList;
}
