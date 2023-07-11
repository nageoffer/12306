<template>
  <Space direction="vertical" :style="{ width: '100%' }">
    <Card title="列表信息（以下余票信息仅供参考）">
      <div class="train-title">
        <div>2023-06-18(周日)</div>
        <div>G103</div>
        <div>次</div>
        <div>北京南</div>
        <div>站</div>
        <div>(06:20开)</div>
        <div>—上海虹桥</div>
        <div>站</div>
        <div>(11:58到)</div>
      </div>
      <Divider dashed></Divider>
      <div>
        *显示的卧铺票价均为上铺票价，供您参考，具体票价以您确认支付实际购买的铺别票价为准
      </div>
    </Card>
    <Card title="乘客信息（填写说明）">
      <div>
        <Space><UserOutlined />乘车人</Space>
      </div>
      <dvi>
        <Space>
          <Checkbox>旺旺</Checkbox>
          <Checkbox>小伙</Checkbox>
        </Space>
      </dvi>
      <Divider dashed></Divider>
      <Form></Form>
      <Table :columns="columns" :data-source="dataSource"></Table>
    </Card>
  </Space>
</template>

<script setup>
import {
  Card,
  Space,
  Divider,
  Checkbox,
  Table,
  Form,
  FormItem
} from 'ant-design-vue'
import { UserOutlined } from '@ant-design/icons-vue'
const columns = [
  {
    dataIndex: 'number',
    title: '序号'
  },
  {
    dataIndex: 'ticket',
    title: '票种'
  },
  {
    dataIndex: 'seat',
    title: '席别'
  },
  {
    dataIndex: 'name',
    title: '姓名'
  },
  {
    dataIndex: 'cardType',
    title: '证件类型'
  },
  {
    dataIndex: 'cardNumber',
    title: '证件号码'
  },
  {
    dataIndex: 'eidt',
    title: '操作'
  }
]

const dataSource = [
  {
    number: 1,
    ticket: '成人票',
    seat: '二等座',
    name: 'yika',
    cardType: '证件类型',
    cardNumber: '证件号码',
    eidt: '操作'
  },
  {
    number: 1,
    ticket: '成人票',
    seat: '二等座',
    name: 'yika',
    cardType: '证件类型',
    cardNumber: '证件号码',
    eidt: '操作'
  },
  {
    number: 1,
    ticket: '成人票',
    seat: '二等座',
    name: 'yika',
    cardType: '证件类型',
    cardNumber: '证件号码',
    eidt: '操作'
  }
]
</script>

<style lang="scss" scoped>
.train-title {
  display: flex;
}
</style>
