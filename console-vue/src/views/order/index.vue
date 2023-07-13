<template>
  <div v-html="state.html"></div>
  <Space :style="{ width: '100%' }" direction="vertical">
    <Card>
      <div class="tip-wrapper">
        <span class="i-lock"></span>
        席位已锁定，请在提示时间内完成支付时间，完成网上购票。支付剩余时间：
        <span class="time">
          {{
            `${dayjs.duration(state.count).minutes()}分${dayjs
              .duration(state.count)
              .seconds()}秒`
          }}
        </span>
      </div>
    </Card>
    <Card title="订单信息">
      <Space :style="{ width: '100%' }" direction="vertical">
        <div>
          <span class="important-text">{{
            state.currentInfo?.ridingDate
          }}</span>
          <span class="important-text"
            >（{{
              getWeekNumber(
                dayjs(state.currentInfo?.ridingDate ?? new Date()).day()
              )
            }}）</span
          >
          <span class="important-text">{{
            state.currentInfo?.trainNumber
          }}</span>
          <span class="small-text">次</span>
          <span class="important-text">{{ state.currentInfo?.departure }}</span>
          <span class="small-text">站</span>
          <span class="important-text"
            >（{{ state.currentInfo?.departureTime }}开）——</span
          >
          <span class="important-text">{{ state.currentInfo?.arrival }}</span>
          <span class="small-text">站</span>
          <span class="important-text"
            >（{{ state.currentInfo?.arrivalTime }}到）</span
          >
        </div>
        <Table
          :columns="columns"
          :pagination="false"
          :dataSource="state.currentInfo?.passengerDetails"
        >
          <template #id="{ text, record, index }"> {{ index + 1 }}</template>
          <template #idType="{ text, record }">
            {{
              ID_CARD_TYPE.find((item) => item.value === text)?.label
            }}</template
          >
          <template #ticketType="{ text, record }">
            {{
              TICKET_TYPE_LIST.find((item) => item.value === text)?.label
            }}</template
          >
          <template #seatType="{ text, record }">
            {{
              SEAT_CLASS_TYPE_LIST.find((item) => item.code === text)?.label
            }}</template
          >
          <template #amount="{ text, record }">
            <span :style="{ color: 'rgb(252, 131, 2)' }"
              >￥{{ text / 100 }}</span
            >
          </template>
        </Table>
        <div :style="{ width: '100%', textAlign: 'end', padding: '10px' }">
          总票价：<span :style="{ color: '#ff8001' }"
            >￥{{ totalAmount }}元</span
          >
        </div>
        <Divider></Divider>
        <div
          :style="{
            width: '100%',
            display: 'flex',
            justifyContent: 'center'
          }"
        >
          <Space size="large">
            <Button @click="() => console.log('取消')">取消订单</Button>
            <Button
              :style="{
                backgroundColor: '#ff8001',
                color: '#fff',
                border: 'none'
              }"
              @click="state.open = true"
              >网上支付</Button
            >
          </Space>
        </div>
      </Space>
    </Card>
  </Space>
  <Modal
    :visible="state.open"
    title="请付款"
    @cancel="state.open = false"
    width="40%"
    :footer="null"
  >
    <Spin :spinning="state.loading">
      <div>
        >>应付金额：<span
          :style="{ fontSize: '20px', color: ' #dc2408', fontWeight: 'bold' }"
          >{{ totalAmount }}
        </span>
        元
      </div>
      <Divider dashed></Divider>
      <div :style="{ overflow: 'hidden' }">
        <div v-for="item in BANK_LIST" class="bank3">
          <div class="bank3_5" @click="() => handlePay(item.value)">
            <img :src="item.img" :alt="item.name" />
          </div>
        </div>
      </div>
    </Spin>
  </Modal>
</template>

<script setup>
import {
  Card,
  Space,
  Table,
  Divider,
  Button,
  Modal,
  message,
  Spin
} from 'ant-design-vue'
import dayjs from 'dayjs'
import { fetchOrderBySn, fetchPay } from '@/service'
import { useRoute } from 'vue-router'
import { onMounted, reactive, computed, toRaw } from 'vue'
import {
  TICKET_TYPE_LIST,
  ID_CARD_TYPE,
  BANK_LIST,
  SEAT_CLASS_TYPE_LIST
} from '@/constants'
import { getWeekNumber } from '@/utils'

const { query } = useRoute()
const state = reactive({
  count: 600000,
  currentInfo: null,
  open: false,
  html: '',
  loading: false
})
const columns = [
  { title: '序号', dataIndex: 'id', slots: { customRender: 'id' } },
  { title: '姓名', dataIndex: 'realName' },
  { title: '证件类型', dataIndex: 'idType', slots: { customRender: 'idType' } },
  { title: '证件号码', dataIndex: 'idCard' },
  {
    title: '票种',
    dataIndex: 'ticketType',
    slots: { customRender: 'ticketType' }
  },
  {
    title: '席别',
    dataIndex: 'seatType',
    slots: { customRender: 'seatType' }
  },
  { title: '车厢', dataIndex: 'carriageNumber' },
  { title: '席位号', dataIndex: 'seatNumber' },
  { title: '票价(元)', dataIndex: 'amount', slots: { customRender: 'amount' } }
]

onMounted(() => {
  setInterval(() => {
    state.count -= 1000
  }, 1000)
  dayjs.duration(state.count).minutes()
  getOrder()
})

const getOrder = () => {
  fetchOrderBySn({ orderSn: query?.sn }).then((res) => {
    if (res.success) {
      state.currentInfo = res.data
    }
  })
}
const totalAmount = computed(() => {
  const amount = state.currentInfo?.passengerDetails?.reduce((pre, nex) => {
    return (
      (pre?.amount ? Number(pre?.amount) : 0) +
      (nex?.amount ? Number(nex?.amount) : 0)
    )
  }, 0)
  return amount ? amount / 100 : 0
})

const handlePay = (channel) => {
  console.log(toRaw(totalAmount))
  if (channel !== 0) {
    return message.error('该支付方式暂未对接，请稍候...')
  }
  const body = {
    channel: 0,
    tradeType: 0,
    orderSn: query.sn,
    totalAmount: totalAmount.value,
    outOrderSn: query.orderSn,
    subject: `${state.currentInfo.departure}-${state.currentInfo.arrival}`
  }
  fetchPay(body).then((res) => {
    state.html = res.data?.body
    state.loading = true
    setTimeout(() => {
      state.loading = false
      window.open(`/aliPay?body=${encodeURIComponent(res.data?.body)}`)
    }, 500)
  })
}
</script>

<style lang="scss" scoped>
.tip-wrapper {
  display: flex;
  align-items: center;
  .i-lock {
    display: inline-block;
    width: 42px;
    height: 42px;
    background: url(https://kyfw.12306.cn/otn/resources/images/bg02.png)
      repeat-x;
    background-position: 0 -250px;
    margin-right: 20px;
  }
  .time {
    color: #fd6a09;
    font-weight: bolder;
  }
}
.important-text {
  font-size: 16px;
  font-weight: bolder;
}
.bank3 {
  float: left;
  width: 170px;
  padding: 8px 0;
  margin-left: 16px;
  .bank3_5 {
    float: left;
    width: 160px;
    cursor: pointer;
  }
}
.cyx-hd {
  position: relative;
  line-height: 20px;
  padding: 5px 5px 5px 65px;
  background-image: linear-gradient(45deg, #fef9ff 0%, #fff 100%);
  border: 1px solid #bfd7e3;
  .cyx-hd-label {
    position: absolute;
    width: 40px;
    top: 50%;
    left: 18px;
    margin-top: -8px;
    height: 16px;
    line-height: 16px;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .icon-cyx {
      float: left;
      width: 16px;
      height: 16px;
      background-image: url(https://kyfw.12306.cn/otn/resources/images/icon-cyx.png);
    }
  }
}
::v-deep {
  .ant-table-thead {
    .ant-table-cell {
      background: #f6f6f6;
    }
  }
}
</style>
