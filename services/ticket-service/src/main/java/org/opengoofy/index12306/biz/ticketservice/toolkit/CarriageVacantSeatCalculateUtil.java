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

package org.opengoofy.index12306.biz.ticketservice.toolkit;

import cn.hutool.core.lang.Pair;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;

/**
 * 座位统计工具类
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class CarriageVacantSeatCalculateUtil {

    /**
     * 座位统计方法
     *
     * @param actualSeats 座位选座情况二位数组
     * @param n           列数
     * @param m           行数
     * @return 空余座位集合小根堆
     */
    public static PriorityQueue<List<Pair<Integer, Integer>>> buildCarriageVacantSeatList(int[][] actualSeats, int n, int m) {
        PriorityQueue<List<Pair<Integer, Integer>>> vacantSeatQueue = new PriorityQueue<>(Comparator.comparingInt(List::size));
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (actualSeats[i][j] == 0) {
                    List<Pair<Integer, Integer>> res = new ArrayList<>();
                    int k = j;
                    for (; k < m; k++) {
                        if (actualSeats[i][k] == 1) break;
                        res.add(new Pair<>(i, k));
                    }
                    j = k;
                    vacantSeatQueue.add(res);
                }
            }
        }
        return vacantSeatQueue;
    }

    /**
     * 空余座位统计方法
     *
     * @param actualSeats 座位状态数组
     * @param n
     * @param m
     * @return 空余座位集合
     */
    public static List<Pair<Integer, Integer>> buildCarriageVacantSeatList2(int[][] actualSeats, int n, int m) {
        List<Pair<Integer, Integer>> vacantSeatList = new ArrayList<>(16);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (actualSeats[i][j] == 0) {
                    vacantSeatList.add(new Pair<>(i, j));
                }
            }
        }
        return vacantSeatList;
    }
}
