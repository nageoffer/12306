<template>
  <Space>
    <Button @click="() => props.cancel(orderSn)" type="link">取消订单</Button>
    <Button type="link" @click="() => props.pay(orderSn)">去支付</Button>
  </Space>
</template>

<script setup>
import { Space, Button } from 'ant-design-vue'
import { defineProps } from 'vue'
const props = defineProps({
  orderSn: String,
  cancel: Function,
  pay: Function
})
</script>

<style lang="scss" scoped>
.class {
}
</style>
