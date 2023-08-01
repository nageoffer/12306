<template>
  <div class="card-container">
    <Tabs type="card" v-model:active-key="state.activeKey">
      <TabPane :key="0" tab="未完成订单"></TabPane>
      <TabPane :key="1" tab="未出行订单"></TabPane>
      <TabPane :key="2" tab="历史订单"></TabPane>
    </Tabs>
  </div>
  <Card :bordered="false" :style="{ padding: '0 10px' }">
    <Table
      :columns="columns"
      :data-source="state.dataSource"
      :pagination="false"
      :loading="state.loading"
    >
      <template #idType="{ text, record }">
        <div>
          <span>{{ record?.realName }}</span>
        </div>
        <div>
          {{
            ID_CARD_TYPE.find((item) => item.value === record?.idType)?.label
          }}
        </div>
      </template>
      <template #seatType="{ text, record }">
        <div>
          {{
            SEAT_CLASS_TYPE_LIST.find((item) => item.code === record?.seatType)
              ?.label
          }}
        </div>
        <div>
          <span>{{ record?.carriageNumber }}</span>
          <span>车</span>
          <span>{{ record?.seatNumber }}</span>
          <span>号</span>
        </div>
      </template>
      <template #amount="{ text, record }">
        <div>
          {{
            TICKET_TYPE_LIST.find((item) => item.value === record?.ticketType)
              ?.label
          }}
        </div>
        <div :style="{ color: 'orange' }">￥{{ record?.amount / 100 }}</div>
      </template>

      <template #status="{ text, record }">
        <div>
          {{
            TICKET_STATUS_LIST.find((item) => item.value === record?.status)
              ?.label
          }}
        </div>
      </template>
    </Table>
    <div align="end" :style="{ width: '100%', marginTop: '20px' }">
      <Pagination
        :show-total="(total) => `总共 ${state.data?.total} 条`"
        :current="state.current"
        :size="state.size"
        :total="state.data?.total"
        show-size-changer
        @change="handlePage"
      ></Pagination>
    </div>
  </Card>
</template>

<script setup>
import { Tabs, TabPane, Table, Card, Pagination, message } from 'ant-design-vue'

import CarInfo from './components/show-card-info'
import EditContent from './components/edit-content'
import { fetchTicketList, fetchOrderCancel } from '@/service'
import { reactive, watch, h } from 'vue'
import {
  ID_CARD_TYPE,
  SEAT_CLASS_TYPE_LIST,
  TICKET_TYPE_LIST,
  TICKET_STATUS_LIST
} from '@/constants'
import Cookie from 'js-cookie'
import { useRouter } from 'vue-router'

const state = reactive({
  activeKey: 0,
  dataSource: [],
  data: null,
  current: 1,
  size: 10,
  loading: false
})
const userId = Cookie.get('userId')
const router = useRouter()

const columns = [
  {
    title: '车次信息',
    dataIndex: 'arrival',
    key: 'arrival',
    slots: { customRender: 'info' },
    customRender: ({ text, record }) => {
      return {
        children: h(CarInfo, {
          trainNumber: record?.trainNumber,
          orderTime: record?.orderTime,
          arrival: record?.arrival,
          departure: record?.departure,
          ridingDate: record?.ridingDate,
          departureTime: record?.departureTime
        }),
        props: {
          rowSpan: record?.rowSpan
        }
      }
    }
  },
  {
    title: '旅客信息',
    dataIndex: 'idType',
    key: 'idType',
    slots: { customRender: 'idType' }
  },
  {
    title: '席位信息',
    dataIndex: 'seatType',
    key: 'seatType',
    slots: { customRender: 'seatType' }
  },
  {
    title: '票价',
    dataIndex: 'amount',
    key: 'amount',
    slots: { customRender: 'amount' }
  },
  {
    title: '车票状态',
    dataIndex: 'status',
    key: 'status',
    slots: { customRender: 'status' }
  },
  {
    title: '操作',
    dataIndex: 'edit',
    key: 'edit',
    slots: { customRender: 'edit' },
    customRender: ({ text, record }) => {
      return {
        children: h(EditContent, { orderSn: record?.orderSn, cancel, pay }),
        props: {
          rowSpan: record?.rowSpan
        }
      }
    }
  }
]

const handlePage = (page, pagesize) => {
  state.current = page
  state.size = pagesize
}
const cancel = (sn) => {
  fetchOrderCancel({ orderSn: sn }).then((res) => {
    if (res.success) {
      message.success('订单取消成功')
      getTicketList(state.current, state.size, state.activeKey)
    } else {
      message.error(res.message)
    }
  })
}

const pay = (sn) => {
  router.push(`/order?sn=${sn}`)
}
const getTicketList = (current, size, statusType) => {
  fetchTicketList({
    userId,
    current,
    size,
    statusType
  })
    .then((res) => {
      let dataSource = []
      res.data.records.map((info) => {
        info.passengerDetails?.map((item, index) => {
          dataSource.push({
            ...info,
            ...item,
            rowSpan: index === 0 ? info.passengerDetails.length : 0
          })
        })
      })
      state.dataSource = dataSource
      state.data = res.data
      state.loading = false
    })
    .catch((err) => {
      console.log(err)
      state.loading = false
    })
}
watch(
  () => [state.activeKey, state.current, state.size],
  (newValue) => {
    state.loading = true
    const [statusType, current, size] = newValue
    getTicketList(current, size, statusType)
  },
  { immediate: true }
)
</script>

<style lang="scss" scoped>
.card-container {
  overflow: hidden;
}

.card-container > .ant-tabs-card > .ant-tabs-content {
  height: 120px;
  margin-top: -16px;
}

.card-container > .ant-tabs-card > .ant-tabs-content > .ant-tabs-tabpane {
  background: #fff;
  //   padding: 16px;
}

.card-container > .ant-tabs-card > .ant-tabs-bar {
  border-color: #fff;
}

.card-container > .ant-tabs-card > .ant-tabs-bar .ant-tabs-tab {
  border-color: transparent;
  background: transparent;
}

.card-container > .ant-tabs-card > .ant-tabs-bar .ant-tabs-tab-active {
  border-color: #fff;
  background: #fff;
}

::v-deep {
  .ant-table-thead > tr > th {
    background-color: #f8f8f8;
  }

  .ant-table-thead .ant-table-cell {
    background-image: none;
  }

  .ant-tabs-top > .ant-tabs-nav {
    margin: 0;
  }

  .ant-tabs-content-holder {
    padding: 12px;
    background-color: #fff;
    box-sizing: border-box;
    background-image: none;
  }
}
</style>
