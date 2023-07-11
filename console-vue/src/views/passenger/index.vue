<template>
  <Card>
    <Space>
      <Input
        v-model:value="state.searchName"
        placeholder="请输入乘客姓名"
        allow-clear
      ></Input>
      <Button @click="searchPassanger">查询</Button>
      <Button type="primary" @click="router.push('/addPassenger?type=create')">
        <template #icon><PlusOutlined /></template>
        添加
      </Button>
      <Button
        danger
        :disabled="!state.selectedRowKeys.length"
        @click="patchDelete"
      >
        <template #icon><DeleteOutlined /></template>
        批量删除</Button
      >
    </Space>
    <Table
      :loading="loading"
      :row-selection="{
        selectedRowKeys: state.selectedRowKeys,
        onChange: onSelectChange
      }"
      :style="{ marginTop: '20px' }"
      :columns="column"
      :data-source="passengerList"
      :pagination="false"
    >
      <template #idType="{ text }">
        <span>{{ text === 0 ? '中国居民身份证' : '其他' }}</span></template
      >
      <template #edit="{ text, record }">
        <span
          @click="() => getDeletePassenger(record.id)"
          :style="{ marginRight: '20px', color: 'red', cursor: 'pointer' }"
          ><DeleteOutlined
        /></span>
        <span
          @click="() => router.push(`/addPassenger?type=edit&id=${record.id}`)"
          :style="{ cursor: 'pointer' }"
          ><EditOutlined /></span
      ></template>
    </Table>
  </Card>
</template>

<script setup>
import { Card, Input, Button, Space, Table, message } from 'ant-design-vue'
import {
  PlusOutlined,
  DeleteOutlined,
  EditOutlined
} from '@ant-design/icons-vue'
import Cookie from 'js-cookie'
import { useRouter } from 'vue-router'
import { fetchPassengerList, fetchDeletePassenger } from '@/service/index'
import { onMounted, reactive, ref, toRaw } from 'vue'

const username = Cookie.get('username')
const passengerList = ref([])
const loading = ref(false)
const state = reactive({
  selectedRowKeys: [],
  searchName: ''
})

onMounted(() => {
  getPassengerList()
})

const getPassengerList = () => {
  loading.value = true
  fetchPassengerList({ username })
    .then((res) => {
      loading.value = false
      if (!res.success) return message.error(res.message)
      passengerList.value =
        res.data.map((item) => ({ ...item, key: item.id })) ?? []
    })
    .catch((err) => {
      loading.value = false
      console.log(err)
    })
}

const getDeletePassenger = (id) => {
  fetchDeletePassenger({ id, username }).then((res) => {
    if (!res.success) return message.error(res.message)
    getPassengerList()
  })
}

const router = useRouter()
const column = [
  { title: '序号', dataIndex: 'id' },
  { title: '姓名', dataIndex: 'realName' },
  { title: '证件类型', dataIndex: 'idType', slots: { customRender: 'idType' } },
  { title: '证件号码', dataIndex: 'idCard' },
  { title: '手机电话', dataIndex: 'phone' },
  { title: '操作', dataIndex: 'edit', slots: { customRender: 'edit' } }
]
const onSelectChange = (value) => {
  state.selectedRowKeys = value
}

const patchDelete = () => {
  state.selectedRowKeys.map((item) => {
    getDeletePassenger(item)
  })
}

const searchPassanger = () => {
  if (state.searchName) {
    passengerList.value =
      passengerList.value.filter(
        (item) => item.realName.indexOf(state.searchName) !== -1
      ) ?? []
  } else {
    getPassengerList()
  }
}
</script>

<style lang="scss" scoped></style>
