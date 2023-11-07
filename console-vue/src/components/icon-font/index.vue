<template>
  <IconFont :type="props.type" />
</template>

<script setup>
import { createFromIconfontCN } from '@ant-design/icons-vue'
const props = defineProps(['type'])
const IconFont = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/c/font_4157208_f23qszocd1l.js'
})
</script>

<style lang="scss" scoped></style>
