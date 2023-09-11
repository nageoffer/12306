package org.opengoofy.index12306.biz.payservice.service;

import org.opengoofy.index12306.biz.payservice.dto.RefundCreateDTO;
import org.opengoofy.index12306.biz.payservice.dto.RefundReqDTO;
import org.opengoofy.index12306.biz.payservice.dto.RefundRespDTO;

/**
 * 退款接口层
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public interface RefundService {
    /**
     * 公共退款接口
     *
     * @param requestParam 退款请求参数
     * @return 退款返回详情
     */
    RefundRespDTO commonRefund(RefundReqDTO requestParam);

    /**
     * 创建退款单
     * @param refundCreateDTO
     */
    void createRefund(RefundCreateDTO refundCreateDTO);
}
