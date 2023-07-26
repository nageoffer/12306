<template>
  <Space>
    <Button @click="props.cancel">取消订单</Button>
    <Button
      :style="{ backgroundColor: 'orange', border: 'none' }"
      type="primary"
      @click="props.pay"
      >去支付</Button
    >
  </Space>
</template>

<script setup>
import { Space, Button } from 'ant-design-vue'
import { defineProps } from 'vue'
const props = defineProps({
  cancel: Function,
  pay: Function
})
// const emit = defineEmits(['cancel', 'pay'])
</script>

<style lang="scss" scoped></style>
