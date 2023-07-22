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
            <Input v-model:value="item.value"></Input>
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
          <span class="info-value">{{ '未知' }}</span></Col
        >
      </Row>
    </div>
    <div v-else>
      <Form :label-col="{ span: 8 }" :wrapper-col="{ span: 4 }">
        <FormItem label="优惠(待)类" required>
          <Input value="未知"></Input>
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
  Col
} from 'ant-design-vue'
import { reactive, onMounted } from 'vue'
import jsCookie from 'js-cookie'
import { fechUserInfo } from '@/service'
const useForm = Form.useForm

const state = reactive({
  contactEditType: 'view',
  otherEditType: 'view',
  userInfoMap: [
    { label: '用户名', value: '--', key: 'username' },
    { label: '姓名', value: '--', key: 'realName' },
    { label: '国家/地区', value: '--', key: 'regin' },
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
      key: 'verifyStatus'
    }
  ],
  editUserInfoMap: [
    { label: '手机号', value: undefined, name: 'phone', require: true },
    { label: '绑定电话', value: undefined, name: 'telephone' },
    { label: '邮箱', value: undefined, name: 'mail' },
    { label: '地址', value: undefined, name: 'address' },
    { label: '邮编', value: undefined, name: 'postCode' }
  ]
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
      console.log(res.data)
      state.userInfoMap = userInfoMap.map((item) => ({
        ...item,
        value: res.data[item.key]
      }))
      state.editUserInfoMap = editUserInfoMap.map((item) => ({
        ...item,
        value: res.data[item.name] ?? '未知'
      }))
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
  state.contactEditType = 'view'
}
const handleOtherSubmit = () => {
  state.otherEditType = 'view'
}
</script>
<style lang="scss" scoped>
.info-wrapper {
  width: 100%;
  text-align: center;
  // padding: 10px;
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
