<template>
  <Card>
    <TypographyTitle :level="5">基本信息</TypographyTitle>
    <Row v-for="info in userInfoMap" class="info-wrapper">
      <Col :span="8" :style="{ textAlign: 'end' }">
        <label class="info-label" :class="!info.unRequire && 'info-require'"
          >{{ info.label }}：</label
        ></Col
      >
      <Col span="4" :style="{ textAlign: 'start' }">
        <span class="info-value" :style="{ color: info.color }">{{
          info.value
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
      <Row v-for="info in editUserInfoMap" class="info-wrapper">
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
        <div v-for="item in editUserInfoMap">
          <FormItem :label="item.label" :required="item.require">
            <Input></Input>
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
          <span class="info-value">{{ '成人' }}</span></Col
        >
      </Row>
    </div>
    <div v-else>
      <Form :label-col="{ span: 8 }" :wrapper-col="{ span: 4 }">
        <FormItem label="优惠(待)类" required>
          <Input></Input>
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
import { reactive } from 'vue'
const userInfoMap = [
  { label: '用户名', value: 'bobowiki' },
  { label: '姓名', value: 'hello' },
  { label: '国家/地区', value: '北京市' },
  { label: '证件类型', value: '身份证' },
  { label: '证件号码', value: '1231231231231231' },
  { label: '核验状态', value: '已通过', unRequire: true, color: '#fe9a5e' }
]
const editUserInfoMap = [
  { label: '手机号', value: '1355555555', name: 'phone', require: true },
  { label: '绑定电话', value: '88888888', name: 'telephone' },
  { label: '邮箱', value: '135655555@163.com', name: 'email' },
  { label: '地址', value: '浙江省杭州市', name: 'address' },
  { label: '邮编', value: '336000', name: 'code' }
]
const state = reactive({
  contactEditType: 'view',
  otherEditType: 'view'
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
