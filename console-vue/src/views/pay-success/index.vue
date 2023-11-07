<template>
  <Space direction="vertical" style="width: 100%">
    <div class="info-container">
      <div class="icon">
        <IconFont type="icon-wancheng" style="font-size: 50px"></IconFont>
      </div>
      <div class="info">
        <div class="top">
          <span class="success-text">交易已完成</span>
          <span class="thank-text">感谢你选择铁路出行！您的订单号是：</span>
          <span class="order-text">{{ state?.orderDetail?.orderSn }}</span>
        </div>
        <div>
          <span class="tip-text"
            >{{
              state.userInfo?.realName
            }}
            先生/女士可持购票时所使用的中国居民身份证原件于购票后、列车开车前到车站直接检票乘车</span
          >
        </div>
      </div>
    </div>
    <div class="custom">
      <Card title="订单信息">
        <div class="ticket-info">
          <span class="main-text"
            >{{ state.orderDetail?.ridingDate }}（{{
              getWeekNumber(dayjs(state.orderDetail?.ridingDate).day())
            }}）{{ state.orderDetail?.trainNumber }}</span
          >
          <span class="small-text">次</span>
          <span class="main-text">{{ state.orderDetail?.departure }}</span>
          <span class="small-text">站</span>
          <span class="main-text"
            >（{{ state.orderDetail?.departureTime }}开）-{{
              state.orderDetail?.arrival
            }}</span
          >
          <span class="small-text"
            >站（{{ state.orderDetail?.arrivalTime }}到）</span
          >
        </div>
        <Table
          :columns="column"
          size="small"
          :data-source="state.orderDetail?.passengerDetails"
          :pagination="false"
        ></Table>
        <Divider></Divider>
        <Space style="justify-content: center; width: 100%">
          <Button :disabled="true">餐饮·特产</Button>
          <Button @click="router.push('/ticketSearch')">继续购票</Button>
          <Button @click="router.push('/ticketList')">查询订单详情</Button>
        </Space>
      </Card>
    </div>
  </Space>
</template>

<script setup scoped>
import { Card, Space, Table, Divider, Button } from 'ant-design-vue'
import IconFont from '@/components/icon-font'
import { fetchOrderBySn, fechUserInfo } from '@/service'
import { h, onMounted, reactive, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import Cookie from 'js-cookie'
import dayjs from 'dayjs'
import {
  ID_CARD_TYPE,
  TICKET_TYPE_LIST,
  SEAT_CLASS_TYPE_LIST,
  TICKET_STATUS_LIST
} from '@/constants'
import { getWeekNumber } from '@/utils'

const column = [
  {
    title: '序号',
    dataIndex: 'id',
    customRender: ({ text, record, index }) =>
      h('div', { innerHTML: index + 1 })
  },
  {
    title: '姓名',
    dataIndex: 'realName'
  },
  {
    title: '证件类型',
    dataIndex: 'idType',
    customRender: ({ text }) =>
      h('div', {
        innerHTML: ID_CARD_TYPE.find((item) => item.value === text)?.label
      })
  },
  {
    title: '证件号码',
    dataIndex: 'idCard'
  },
  {
    title: '票种',
    dataIndex: 'ticketType',
    customRender: ({ text }) =>
      h('div', {
        innerHTML: TICKET_TYPE_LIST.find((item) => item.value === text)?.label
      })
  },
  {
    title: '席别',
    dataIndex: 'seatType',
    customRender: ({ text }) =>
      h('div', {
        innerHTML: SEAT_CLASS_TYPE_LIST.find((item) => item.code === text)
          ?.label
      })
  },
  {
    title: '车厢',
    dataIndex: 'carriageNumber',
    customRender: ({ text }) =>
      h('div', {
        innerHTML: text + '车'
      })
  },
  {
    title: '席位号',
    dataIndex: 'seatNumber'
  },
  {
    title: '票价（元）',
    dataIndex: 'amount',
    customRender: ({ text }) =>
      h('a', {
        innerHTML: text / 100 + '¥'
      })
  },
  {
    title: '订单状态',
    dataIndex: 'status',
    customRender: ({ text }) =>
      h('div', {
        innerHTML: TICKET_STATUS_LIST.find((item) => item.value === text)?.label
      })
  }
]

const { query } = useRoute()
const router = useRouter()
const state = reactive({
  orderDetail: null,
  userInfo: null
})

onMounted(() => {
  fetchOrderBySn({ orderSn: query?.orderSn }).then((res) => {
    state.orderDetail = res?.data
  })
  fechUserInfo({ username: Cookie.get('username') }).then((res) => {
    state.userInfo = res?.data
  })
})
</script>

<style lang="scss" scoped>
.info-container {
  width: 100%;
  border: 1px solid #4a8dc9;
  padding: 20px 40px;
  background-color: #f0fed1;
  display: flex;
  align-items: center;
  .icon {
    margin-right: 30px;
  }
  .info {
    .top {
      margin-bottom: 6px;
      .success-text {
        color: #9ecf6a;
        font-size: 16px;
        font-weight: bolder;
        margin-right: 6px;
      }
      .thank-text {
        font-size: 14px;
        color: black;
      }
      .order-text {
        font-size: 16px;
        color: #eb8940;
        font-weight: bolder;
      }
    }

    .tip-text {
      color: rgba($color: black, $alpha: 0.6);
    }
  }
}
.ticket-info {
  margin-bottom: 6px;
  .main-text {
    font-size: 16px;
    font-weight: bolder;
  }
  .small-text {
    font-size: 14px;
  }
}
::v-deep {
  .ant-table-thead {
    .ant-table-cell {
      background: #f3f3f3 !important;
      background-color: #f3f3f3 !important;
    }
  }
}
</style>
