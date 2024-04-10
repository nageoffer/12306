<template>
  <Card>
    <Alert
      show-icon
      type="warning"
      message="如旅客身份信息未能在添加后的24小时内通过核验，请乘车人持有效身份证原件到车站办理身份核验。"
    ></Alert>
    <Card :bordered="false">
      <Form :label-col="{ span: 10 }" :wrapper-col="{ span: 4 }">
        <TypographyTitle :level="5">基本信息</TypographyTitle>
        <FormItem label="证件类型" v-bind="validateInfos.idType">
          <Select :disabled="disabled" v-model:value="formData.idType">
            <SelectOption :value="0">身份证</SelectOption>
          </Select>
        </FormItem>
        <FormItem label="姓名" v-bind="validateInfos.realName">
          <Input :disabled="disabled" v-model:value="formData.realName"></Input>
        </FormItem>
        <FormItem label="证件号码" v-bind="validateInfos.idCard">
          <Input :disabled="disabled" v-model:value="formData.idCard"></Input>
        </FormItem>
        <TypographyTitle :level="5">联系方式</TypographyTitle>
        <FormItem label="手机号" v-bind="validateInfos.phone">
          <Input v-model:value="formData.phone"></Input>
        </FormItem>
        <TypographyTitle :level="5">附加信息</TypographyTitle>
        <FormItem label="优惠(待)类型" v-bind="validateInfos.discountType">
          <Select :disabled="disabled" v-model:value="formData.discountType">
            <!-- <SelectOption :value="0">无优惠</SelectOption>
            <SelectOption :value="1">学生优惠</SelectOption> -->
            <SelectOption v-for="item in DISCOUNTS_TYPE" :value="item.value">
              {{ item.label }}</SelectOption
            >
          </Select>
        </FormItem>
        <Row align="center">
          <Space>
            <Button @click="() => router.push('/passenger')">取消</Button>
            <Button :loading="loading" type="primary" @click="onSubmit"
              >保存</Button
            ></Space
          >
        </Row>
      </Form>
    </Card>
  </Card>
</template>

<script setup>
import {
  Card,
  Alert,
  Form,
  TypographyTitle,
  FormItem,
  Select,
  Input,
  Button,
  Space,
  Row,
  SelectOption,
  message
} from 'ant-design-vue'

import { reactive, toRaw, ref, onMounted } from 'vue'
import {
  fetchAddPassenger,
  fetchPassengerList,
  fetchEditPassenger
} from '@/service'
import { DISCOUNTS_TYPE } from '@/constants'
import { useRouter, useRoute } from 'vue-router'
import Cookie from 'js-cookie'
const useForm = Form.useForm
const router = useRouter()
const { query } = useRoute()
const username = Cookie.get('username')

const disabled = useRoute().query?.type === 'edit'

let formData = ref({
  realName: '',
  idType: undefined,
  discountType: undefined,
  phone: '',
  idCard: ''
})

const loading = ref(false)

const rulesRef = reactive({
  username: [
    {
      required: true,
      message: '请完善信息'
    }
  ],
  realName: [
    {
      required: true,
      message: '请完善信息'
    }
  ],
  idType: [
    {
      required: true,
      message: '请完善信息'
    }
  ],
  discountType: [
    {
      required: true,
      message: '请完善信息'
    }
  ],
  phone: [
    {
      required: true,
      message: '格式不正确，请完善',
      pattern: /^1(3|5|6|7|8)[0-9]{9}$/
    }
  ]
})

const { resetFields, validate, validateInfos } = useForm(formData, rulesRef)

onMounted(() => {
  query.type === 'edit' &&
    fetchPassengerList({ username }).then((res) => {
      if (res.data?.length) {
        const userInfo = res.data.find((item) => item.id == query.id)
        formData.value = { ...formData.value, ...userInfo }
      }
    })
})

const onSubmit = () => {
  console.log(query)
  validate()
    .then(() => {
      loading.value = true
      let params = { username, ...toRaw(formData.value) }
      if (query.type === 'edit') {
        const { id, phone } = formData.value
        params = { id, phone, username }
        return fetchEditPassenger(params).then((res) => {
          if (res.success) {
            message.success(
              `乘车人${query.type === 'edit' ? '修改' : '创建'}成功`
            )
            router.push('/passenger')
          } else {
            message.error(res.message)
            loading.value = false
          }
        })
      }
      fetchAddPassenger(params)
        .then((res) => {
          loading.value = true
          if (res.success) {
            message.success(
              `乘车人${query.type === 'edit' ? '修改' : '创建'}成功`
            )
            router.push('/passenger')
          } else {
            message.error(res.message)
            loading.value = false
          }
        })
        .catch((error) => console.log(error))
    })
    .catch((err) => console.log(err))
}
</script>

<style lang="scss" scoped></style>
