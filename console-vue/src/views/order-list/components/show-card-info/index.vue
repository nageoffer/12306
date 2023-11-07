<template>
  <div>
    <div class="order-date">订票日期：{{ props.orderTime }}</div>
    <div>
      <span class="border">{{ departure }}</span>
      <span class="border">{{ '-->' }}</span>
      <span class="border">{{ arrival }}</span
      ><span class="border">{{ props['trainNumber'] }}</span>
    </div>
    <div>
      <span class="margin">{{ props['ridingDate'] }}</span>
      <span class="margin">{{ props['departureTime'] }}</span>
      <span class="margin">开</span>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  orderTime: String,
  departure: String,
  arrival: String,
  trainNumber: String,
  ridingDate: String,
  departureTime: String
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
