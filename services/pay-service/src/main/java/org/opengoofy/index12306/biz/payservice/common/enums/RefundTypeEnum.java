package org.opengoofy.index12306.biz.payservice.common.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum RefundTypeEnum {

    PARTIAL_REFUND(11, "PARTIAL_REFUND", "部分退款"),

    FULL_REFUND(12, "FULL_REFUND", "全部退款");

    @Getter
    private final Integer code;

    @Getter
    private final String name;

    @Getter
    private final String value;
}
