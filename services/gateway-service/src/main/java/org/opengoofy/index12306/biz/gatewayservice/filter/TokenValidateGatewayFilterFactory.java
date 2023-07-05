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

package org.opengoofy.index12306.biz.gatewayservice.filter;

import org.opengoofy.index12306.biz.gatewayservice.config.Config;
import org.opengoofy.index12306.biz.gatewayservice.toolkit.JWTUtil;
import org.opengoofy.index12306.biz.gatewayservice.toolkit.UserInfoDTO;
import org.opengoofy.index12306.framework.starter.bases.constant.UserConstant;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * SpringCloud Gateway Token 拦截器
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
public class TokenValidateGatewayFilterFactory extends AbstractGatewayFilterFactory<Config> {

    public TokenValidateGatewayFilterFactory() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();
            String requestPath = request.getPath().toString();
            if (!isPathInWhiteList(requestPath, config.getWhitePathList())) {
                if (isPathInBlackPreList(requestPath, config.getBlackPathPreList())) {
                    String token = request.getHeaders().getFirst("Authorization");
                    UserInfoDTO userInfo = JWTUtil.parseJwtToken(token);
                    if (!validateToken(userInfo)) {
                        ServerHttpResponse response = exchange.getResponse();
                        response.setStatusCode(HttpStatus.UNAUTHORIZED);
                        return response.setComplete();
                    }
                    ServerHttpRequest.Builder builder = exchange.getRequest().mutate().headers(httpHeaders -> {
                        httpHeaders.set(UserConstant.USER_ID_KEY, userInfo.getUserId());
                        httpHeaders.set(UserConstant.USER_NAME_KEY, userInfo.getUsername());
                        httpHeaders.set(UserConstant.REAL_NAME_KEY, userInfo.getRealName());
                    });
                    return chain.filter(exchange.mutate().request(builder.build()).build());
                }
            }
            return chain.filter(exchange);
        };
    }

    private boolean isPathInWhiteList(String requestPath, List<String> whitelist) {
        return whitelist.stream().anyMatch(requestPath::startsWith);
    }

    private boolean isPathInBlackPreList(String requestPath, List<String> blackPathPre) {
        return blackPathPre.stream().anyMatch(requestPath::startsWith);
    }

    private boolean validateToken(UserInfoDTO userInfo) {
        return userInfo != null ? true : false;
    }
}
