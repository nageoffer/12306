<template>
  <Card>
    <TypographyTitle :level="5">基本信息</TypographyTitle>
    <Row v-for="info in state.userInfoMap" class="info-wrapper">
      <Col :span="8" :style="{ textAlign: 'end' }">
        <label class="info-label" :class="!info.unRequire && 'info-require'"
          >{{ info.label }}：</label
        ></Col
      >
      <Col span="4" :style="{ textAlign: 'start' }">
        <span class="info-value" :style="{ color: info.color }">{{
          info?.render ? info.render(info.value) : info.value ?? '--'
        }}</span>
      </Col>
    </Row>
    <Divider dashed></Divider>
    <div class="title-wrapper">
      <TypographyTitle :level="5">联系方式</TypographyTitle>
      <Button
        @click="handleContactEditTypeChange"
        v-if="state.contactEditType === 'view'"
        >编辑</Button
      >
      <Button @click="handleContactSubmit" v-else>保存</Button>
    </div>
    <div v-if="state.contactEditType === 'view'">
      <Row v-for="info in state.editUserInfoMap" class="info-wrapper">
        <Col :span="8" :style="{ textAlign: 'end' }">
          <label class="info-label" :class="info.require && 'info-require'"
            >{{ info.label }}：</label
          >
        </Col>
        <Col :span="4" :style="{ textAlign: 'start' }">
          <span class="info-value">{{ info.value }}</span></Col
        >
      </Row>
    </div>
    <div v-else>
      <Form :label-col="{ span: 8 }" :wrapper-col="{ span: 4 }">
        <div v-for="item in state.editUserInfoMap">
          <FormItem :label="item.label" :required="item.require">
            <Input
              v-model:value="item.value"
              :disabled="item.name === 'phone'"
            ></Input>
          </FormItem>
        </div>
      </Form>
    </div>
    <Divider dashed></Divider>
    <div class="title-wrapper">
      <TypographyTitle :level="5">附加信息</TypographyTitle>
      <Button
        @click="handleOtherEditTypeChange"
        v-if="state.otherEditType === 'view'"
        >编辑</Button
      >
      <Button @click="handleOtherSubmit" v-else>保存</Button>
    </div>
    <div v-if="state.otherEditType === 'view'">
      <Row class="info-wrapper">
        <Col :span="8" :style="{ textAlign: 'end' }">
          <label class="info-label info-require">优惠(待)类</label>
        </Col>
        <Col :span="4" :style="{ textAlign: 'start' }">
          <span class="info-value">{{
            DISCOUNTS_TYPE.find((item) => item.value === state.userType)?.label
          }}</span></Col
        >
      </Row>
    </div>
    <div v-else>
      <Form :label-col="{ span: 8 }" :wrapper-col="{ span: 4 }">
        <FormItem label="优惠(待)类" required>
          <Select v-model:value="state.userType">
            <SelectOption v-for="item in DISCOUNTS_TYPE" :value="item.value">{{
              item.label
            }}</SelectOption>
          </Select>
        </FormItem>
      </Form>
    </div>
  </Card>
</template>

<script setup>
import {
  Card,
  Form,
  FormItem,
  TypographyTitle,
  Input,
  Button,
  Divider,
  Row,
  Col,
  Select,
  SelectOption,
  message
} from 'ant-design-vue'
import { reactive, onMounted } from 'vue'
import jsCookie from 'js-cookie'
import { fechUserInfo, fetchUserUpdate } from '@/service'
import { REGIN_MAP, CHECK_STATUS, DISCOUNTS_TYPE } from '@/constants'
const useForm = Form.useForm

const state = reactive({
  contactEditType: 'view',
  otherEditType: 'view',
  userInfoMap: [
    { label: '用户名', value: '--', key: 'username' },
    { label: '姓名', value: '--', key: 'realName' },
    {
      label: '国家/地区',
      value: '--',
      key: 'region',
      render: (value) => REGIN_MAP.find((item) => item.value === value)?.label
    },
    {
      label: '证件类型',
      value: '--',
      key: 'idType',
      render: (value) => (value === 0 ? '身份证' : '未知')
    },
    { label: '证件号码', value: '--', key: 'idCard' },
    {
      label: '核验状态',
      value: '--',
      unRequire: true,
      color: '#fe9a5e',
      key: 'verifyStatus',
      render: (value) =>
        CHECK_STATUS.find((item) => item.value === value)?.label ?? '--'
    }
  ],
  editUserInfoMap: [
    { label: '手机号', value: undefined, name: 'phone', require: true },
    { label: '邮箱', value: undefined, name: 'mail' },
    { label: '地址', value: undefined, name: 'address' },
    { label: '邮编', value: undefined, name: 'postCode' }
  ],
  userType: undefined
})

const username = jsCookie.get('username')

const { validate } = useForm(
  state.editUserInfoMap,
  reactive({
    phone: [{ required: true, message: '请输入手机号' }]
  })
)

onMounted(() => {
  fechUserInfo({ username }).then((res) => {
    const { userInfoMap, editUserInfoMap } = state
    if (res.success) {
      state.userInfoMap = userInfoMap.map((item) => ({
        ...item,
        value: res.data[item.key]
      }))
      state.editUserInfoMap = editUserInfoMap.map((item) => ({
        ...item,
        value: res.data[item.name] ?? ''
      }))
      state.userType = res.data?.userType
    }
  })
})

const handleContactEditTypeChange = () => {
  state.contactEditType = state.contactEditType === 'view' ? 'edit' : 'view'
}
const handleOtherEditTypeChange = () => {
  state.otherEditType = state.otherEditType === 'view' ? 'edit' : 'view'
}

const handleContactSubmit = () => {
  fetchUserUpdate({
    username: username,
    mail: state.editUserInfoMap.find((item) => item.name === 'mail')?.value,
    postCode: state.editUserInfoMap.find((item) => item.name === 'postCode')
      ?.value,
    address: state.editUserInfoMap.find((item) => item.name === 'address')
      ?.value
  })
    .then((res) => {
      if (res.success) {
        state.contactEditType = 'view'
        message.success('修改信息成功')
      } else {
        message.error(res.message)
      }
    })
    .catch((err) => {
      state.contactEditType = 'view'
      console.log('err:::', err)
    })
}
const handleOtherSubmit = () => {
  fetchUserUpdate({
    username: username,
    userType: state.userType
  })
    .then((res) => {
      if (res.success) {
        state.otherEditType = 'view'
        message.success('修改信息成功')
      } else {
        message.error(res.message)
      }
    })
    .catch((err) => {
      state.otherEditType = 'view'
      console.log('err:::', err)
    })
}
</script>
<style lang="scss" scoped>
.info-wrapper {
  width: 100%;
  text-align: center;
  /* // padding: 10px; */
  margin-bottom: 24px;
  height: 32px;
  line-height: 32px;
  .info-label {
    display: inline-block;
    color: #787878;
  }
  .info-require::before {
    content: '* ';
    color: red;
  }
  .info-value {
    display: inline-block;
    padding: 0 10px;
    font-weight: bolder;
  }
}

.title-wrapper {
  display: flex;
  justify-content: space-between;
}
::v-deep {
  .ant-form-item-label {
    label {
      color: #787878;
    }
  }
}
</style>
