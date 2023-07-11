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

package org.opengoofy.index12306.framework.starter.idempotent.annotation;

import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentSceneEnum;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentTypeEnum;
import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * RestAPI业务场景幂等注解
 * 暂时没有找到在 AOP 处理比较优雅的方式，暂时废弃
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Deprecated
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Idempotent(scene = IdempotentSceneEnum.RESTAPI)
public @interface RestAPIIdempotent {

    /**
     * {@link Idempotent#key} 的别名
     */
    @AliasFor(annotation = Idempotent.class, attribute = "key")
    String key() default "";

    /**
     * {@link Idempotent#message} 的别名
     */
    @AliasFor(annotation = Idempotent.class, attribute = "message")
    String message() default "您操作太快，请稍后再试";

    /**
     * {@link Idempotent#type} 的别名
     */
    @AliasFor(annotation = Idempotent.class, attribute = "type")
    IdempotentTypeEnum type() default IdempotentTypeEnum.PARAM;
}
