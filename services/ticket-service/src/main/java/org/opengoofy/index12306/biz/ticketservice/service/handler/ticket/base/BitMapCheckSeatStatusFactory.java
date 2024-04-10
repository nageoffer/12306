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

package org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base;

import org.opengoofy.index12306.framework.starter.bases.Singleton;

/**
 * 座位通过 BitMap 检测抽象工厂
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public abstract class BitMapCheckSeatStatusFactory {

    public static final String TRAIN_BUSINESS = "TRAIN_BUSINESS";
    public static final String TRAIN_FIRST = "TRAIN_FIRST";
    public static final String TRAIN_SECOND = "TRAIN_SECOND";

    /**
     * 获取座位检查方法实例
     *
     * @param mark 座位标识
     * @return 座位检查类
     */
    public static BitMapCheckSeat getInstance(String mark) {
        BitMapCheckSeat instance = null;
        switch (mark) {
            case TRAIN_BUSINESS -> {
                instance = Singleton.get(TRAIN_BUSINESS);
                if (instance == null) {
                    instance = new TrainBusinessCheckSeat();
                    Singleton.put(TRAIN_BUSINESS, instance);
                }
            }
            case TRAIN_FIRST -> {
                instance = Singleton.get(TRAIN_FIRST);
                if (instance == null) {
                    instance = new TrainFirstCheckSeat();
                    Singleton.put(TRAIN_FIRST, instance);
                }
            }
            case TRAIN_SECOND -> {
                instance = Singleton.get(TRAIN_SECOND);
                if (instance == null) {
                    instance = new TrainSecondCheckSeat();
                    Singleton.put(TRAIN_SECOND, instance);
                }
            }
        }
        return instance;
    }
}
