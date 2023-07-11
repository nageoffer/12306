<template>
  <!-- <div v-html="<form name='punchout_form' method='post' action='https://openapi-sandbox.dl.alipaydev.com/gateway.do?charset=UTF8&method=alipay.trade.page.pay&sign=tpMfrnmi%2FM4RyFGJZ3VEM%2Bjfq7rU%2Bat%2F3KX4yOM41A6BfQgCmhUoH7IuKhdwf7%2B4BtBfNEdwYODHPyMpmubNXB7EbOEWcl2warG%2FH9iHzXPvOAWXNJrfy4Nyr8XiEuPpENQUwhp6ws1caOtJ3juIXGfKeDLcKbq0lSoDUO2N0aqg4h0DmNph%2BmVJM%2F2BfKix%2BRoP9WGXBM%2FQewJsZ3wwxldDlGMSt73TLfLhPp5GXa4ac%2FOGcXqvxrQG1r3cpbvgbLCvEZhVKN3PAOMujphHOFCAi1GLuIreEXZAV638TckGIToQhLHpkS6urDOc2V2j7hXG3sS2SOA6hXSKM5BwwA%3D%3D&notify_url=http%3A%2F%2Fems8b7.natappfree.cc%2Fapi%2Fpay-service%2Fcallback%2Falipay&version=1.0&app_id=2021000122637271&sign_type=RSA2&timestamp=2023-07-11+22%3A20%3A01&alipay_sdk=alipay-sdk-java-4.38.10.ALL&format=json'><input type='hidden' name='biz_content' value='{&quot;out_trade_no&quot;:&quot;1678771125508296704&quot;,&quot;product_code&quot;:&quot;FAST_INSTANT_TRADE_PAY&quot;,&quot;subject&quot;:&quot;北京南-杭州东&quot;,&quot;total_amount&quot;:&quot;462600&quot;}'><input type='submit' value='立即支付' style='display:none' ></form><script>document.forms[0].submit();</script>"></div> -->
</template>

<script setup>
import Vue, { reactive, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const { query } = useRoute()
const state = reactive({
  body: ''
})

onMounted(() => {
  //   const profile = Vue.extend({
  //     template
  //   })
  //   state.body = query
})
</script>

<style lang="scss" scoped></style>
