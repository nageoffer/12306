<template>
  <div>
    <Breadcrumb>
      <BreadcrumbItem>
        <IconFont type="icon-huochezhanxiao" />
        <span>12306</span></BreadcrumbItem
      >
      <BreadcrumbItem
        ><IconFont :type="currentPath?.icon" color="black" />
        <span>{{ currentPath?.label }}</span></BreadcrumbItem
      >
    </Breadcrumb>
  </div>
</template>

<script setup>
import { Breadcrumb, BreadcrumbItem } from 'ant-design-vue'
import { useRoute } from 'vue-router'
import { routes } from '@/router'
import { watch, ref } from 'vue'
import IconFont from '@/components/icon-font'
const route = useRoute()
const currentPath = ref(null)

watch(
  () => route.path,
  (newValue) => {
    currentPath.value = routes.find((item) => item?.path === newValue)
  },
  { immediate: true }
)
</script>

<style lang="scss" scoped>
::v-deep {
  .ant-breadcrumb {
    margin-bottom: 10px;
  }
}
</style>
