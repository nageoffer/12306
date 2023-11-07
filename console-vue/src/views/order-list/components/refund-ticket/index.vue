<template>
  <div>
    {{
      TICKET_STATUS_LIST.find((item) => item.value === props?.status)?.label ??
      '--'
    }}
  </div>
  <div v-if="props?.status === 10">
    <a @click="props.refundClick">退票</a>
  </div>
</template>

<script setup>
import { TICKET_STATUS_LIST } from '@/constants'
const props = defineProps({
  status: Number,
  refundClick: Function
})
</script>

<style lang="scss" scoped>
.order-date {
  color: #8f9598;
  padding: 6px 0;
}
.border {
  font-weight: bolder;
  padding: 0 4px;
}
.margin {
  padding: 0 4px;
}
</style>
