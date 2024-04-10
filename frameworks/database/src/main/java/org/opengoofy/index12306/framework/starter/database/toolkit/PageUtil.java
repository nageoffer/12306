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

package org.opengoofy.index12306.framework.starter.database.toolkit;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.opengoofy.index12306.framework.starter.common.toolkit.BeanUtil;
import org.opengoofy.index12306.framework.starter.convention.page.PageRequest;
import org.opengoofy.index12306.framework.starter.convention.page.PageResponse;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 分页工具类
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public class PageUtil {

    /**
     * {@link PageRequest} to {@link Page}
     */
    public static Page convert(PageRequest pageRequest) {
        return convert(pageRequest.getCurrent(), pageRequest.getSize());
    }

    /**
     * {@link PageRequest} to {@link Page}
     */
    public static Page convert(long current, long size) {
        return new Page(current, size);
    }

    /**
     * {@link IPage} to {@link PageResponse}
     */
    public static PageResponse convert(IPage iPage) {
        return buildConventionPage(iPage);
    }

    /**
     * {@link IPage} to {@link PageResponse}
     */
    public static <TARGET, ORIGINAL> PageResponse<TARGET> convert(IPage<ORIGINAL> iPage, Class<TARGET> targetClass) {
        iPage.convert(each -> BeanUtil.convert(each, targetClass));
        return buildConventionPage(iPage);
    }

    /**
     * {@link IPage} to {@link PageResponse}
     */
    public static <TARGET, ORIGINAL> PageResponse<TARGET> convert(IPage<ORIGINAL> iPage, Function<? super ORIGINAL, ? extends TARGET> mapper) {
        List<TARGET> targetDataList = iPage.getRecords().stream()
                .map(mapper)
                .collect(Collectors.toList());
        return PageResponse.<TARGET>builder()
                .current(iPage.getCurrent())
                .size(iPage.getSize())
                .records(targetDataList)
                .total(iPage.getTotal())
                .build();
    }

    /**
     * {@link IPage} build to {@link PageResponse}
     */
    private static PageResponse buildConventionPage(IPage iPage) {
        return PageResponse.builder()
                .current(iPage.getCurrent())
                .size(iPage.getSize())
                .records(iPage.getRecords())
                .total(iPage.getTotal())
                .build();
    }
}
