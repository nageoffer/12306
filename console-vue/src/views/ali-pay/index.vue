<template>
  <div v-html="decodeURI(query.body)"></div>
</template>

<script setup>
import Vue, { reactive, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const { query } = useRoute()

console.log(query.body)
setTimeout(() => {
  document.forms[0]?.submit()
}, 100)
// const state = reactive({
//   body: ''
// })

// onMounted(() => {
//   //   const profile = Vue.extend({
//   //     template
//   //   })
//   //   state.body = query
// })
</script>

<style lang="scss" scoped></style>
