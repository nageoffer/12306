<template>
  <div class="card-container">
    <Tabs type="card" v-model:active-key="state.activeKey">
      <TabPane :key="0" tab="未完成订单"></TabPane>
      <TabPane :key="1" tab="未出行订单"></TabPane>
      <TabPane :key="2" tab="历史订单"></TabPane>
    </Tabs>
  </div>
  <Card :bordered="false" :style="{ padding: '0 10px' }">
    <CheckboxGroup
      :style="{ width: '100%' }"
      v-model:value="state.checkList"
      @change="
        (e) => {
          state.checkList = e
        }
      "
    >
      <Table
        :columns="state.columns"
        :data-source="state.dataSource"
        :pagination="false"
        :loading="state.loading"
        :bordered="true"
      >
        <template #id="{ text, record }">
          <div
            :style="{
              display: 'flex',
              alignItems: 'center'
            }"
          >
            <!-- <div
              v-if="state.activeKey !== 0"
              :style="{ marginRight: '20px', width: '30px' }"
            >
              <Checkbox
                :value="text"
                @change="
                  (e) => {
                    if (e.target.value) {
                      state.refundOrder = [
                        ...state.refundOrder,
                        { orderSN: record.orderSN, refundList }
                      ]
                    } else {
                      state.refundOrder = state.refundOrder.filter(
                        (item) => item !== text
                      )
                    }
                  }
                "
              ></Checkbox>
            </div> -->
            <div>
              <span :style="{ marginRight: '5px', width: '60%' }">{{
                record?.realName
              }}</span>
              <a
                v-if="state.activeKey !== 0"
                :style="{ textDecoration: 'underline' }"
                >打印信息单</a
              >
            </div>
            <div>
              {{
                ID_CARD_TYPE.find((item) => item.value === record?.idType)
                  ?.label
              }}
            </div>
          </div>
        </template>
        <template #seatType="{ text, record }">
          <div>
            {{
              SEAT_CLASS_TYPE_LIST.find(
                (item) => item.code === record?.seatType
              )?.label
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
                ?.label ?? '--'
            }}
          </div>
          <div v-if="record?.status === 10">
            <Button
              type="link"
              @click="
                () => {
                  state.visible = true
                  state.currentOrder = record?.orderSn
                }
              "
              >退票</Button
            >
          </div>
        </template>
        <!-- <template #summary v-if="state.activeKey !== 0">
          <TableSummary :fixed="fixedTop ? 'top' : 'bottom'">
            <TableSummaryRow>
              <TableSummaryCell :index="0" :col-span="24">
                <div>
                  <Checkbox
                    v-model:checked="state.checkedAll"
                    @change="onCheckAllChange"
                    :indeterminate="state.indeterminate"
                    >全选</Checkbox
                  >
                </div>
              </TableSummaryCell>
            </TableSummaryRow>
          </TableSummary>
        </template> -->
      </Table>
    </CheckboxGroup>
    <div
      :style="{
        width: '100%',
        marginTop: '20px',
        display: 'flex',
        justifyContent: 'end'
      }"
    >
      <Pagination
        :show-total="(total) => `总共 ${state.data?.total} 条`"
        :current="state.current"
        :size="state.size"
        :total="state.data?.total"
        show-size-changer
        @change="handlePage"
      ></Pagination>
    </div>
    <div class="tips-txt">
      <h2 :style="{ fontSize: '16px' }">温馨提示：</h2>
      <p>1. 席位已锁定，请在指定时间内完成网上支付。</p>
      <p>2. 逾期未支付，系统将取消本次交易。</p>
      <p>3. 在完成支付或取消订单之前，您将无法购买其他车票</p>
      <p>
        4.
        未尽事宜详见《国铁集团铁路旅客运输规程》《广深港高铁铁路跨境旅客运输组织规则》《中老铁路跨境旅客联运组织规则》等有关规定和车站公告。
      </p>
    </div>
  </Card>
  <Modal
    width="40%"
    :visible="state.visible"
    title="退票申请"
    class="custom-modal"
    @cancel="state.visible = false"
    :footer="null"
  >
    <Alert
      message="您确认要退款吗？"
      type="warning"
      description="如有定餐饮或特产，请按规定到网站自行办理退订"
      show-icon
      style="background-color: #fff; border: none"
    >
      <template #icon><QuestionCircleFilled /></template>
    </Alert>
    <Divider :dashed="true" />
    <div style="padding: 0 30px">
      请选择要退票的订单：
      <CheckboxGroup
        v-model:value="state.refundOrder"
        @change="(value) => console.log(value, 'value')"
        :options="
          state.dataSource
            ?.find((item) => item.orderSn === state.currentOrder)
            .passengerDetails.map((item) => ({
              label: item.realName,
              value: item.id
            }))
        "
      ></CheckboxGroup>
    </div>

    <Divider :dashed="true" />
    <div style="padding: 0 30px">
      共计退款：<a>{{
        '¥' +
        state.dataSource
          ?.find((item) => item.orderSn === state.currentOrder)
          ?.passengerDetails?.filter((item) =>
            state.refundOrder.includes(item.id)
          )
          ?.map((item) => item.amount)
          ?.reduce((after, pre) => after + pre, 0) /
          100
      }}</a>
    </div>
    <Divider :dashed="true" />
    <div style="padding: 0 30px">
      <div style="margin-bottom: 20px">
        车票票价：<a>{{
          '¥' +
          state.dataSource
            ?.find((item) => item.orderSn === state.currentOrder)
            ?.passengerDetails?.filter((item) =>
              state.refundOrder.includes(item.id)
            )
            ?.map((item) => item.amount)
            ?.reduce((after, pre) => after + pre, 0) /
            100
        }}</a>
      </div>
      <div>
        应退票款：<a>{{
          '¥' +
          state.dataSource
            ?.find((item) => item.orderSn === state.currentOrder)
            ?.passengerDetails?.filter((item) =>
              state.refundOrder.includes(item.id)
            )
            ?.map((item) => item.amount)
            ?.reduce((after, pre) => after + pre, 0) /
            100
        }}</a>
      </div>
    </div>
    <Divider :dashed="true" />
    <div style="color: #999999; padding: 0 30px">
      <QuestionCircleFilled />
      <span style="margin-left: 20px"
        >实际核收退票费及应退票款将按最终交易时间计算。</span
      >
    </div>
    <div style="color: #999999; padding: 0 30px">
      <QuestionCircleFilled />
      <span style="margin-left: 20px"
        >如你需要办理该次列车前续、后续退票业务，请于退票车次票面开车时间前办理。</span
      >
    </div>
    <Space style="width: 100%; justify-content: center; margin-top: 20px">
      <Button @click="state.visible = false">取消</Button>
      <Button
        @click="handleRefund"
        type="primary"
        :disabled="!state.refundOrder.length"
        >确定</Button
      >
    </Space>
  </Modal>
</template>

<script setup>
import {
  Tabs,
  TabPane,
  Table,
  Card,
  Pagination,
  message,
  // CheckboxGroup,
  // Checkbox,
  // TableSummary,
  // TableSummaryCell,
  // TableSummaryRow,
  CheckboxGroup,
  Modal,
  Alert,
  Divider,
  Space,
  Button
} from 'ant-design-vue'
import { QuestionCircleFilled } from '@ant-design/icons-vue'

import CarInfo from './components/show-card-info'
import EditContent from './components/edit-content'
import RefundTicket from './components/refund-ticket'
import { fetchTicketList, fetchOrderCancel, fetchRefundTicket } from '@/service'
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
  loading: false,
  columns: [],
  checkList: [],
  checkedAll: false,
  visible: false,
  currentOrder: undefined,
  refundOrder: []
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
    dataIndex: 'id',
    key: 'id',
    slots: { customRender: 'id' }
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
    slots: { customRender: 'status' },
    customRender: ({ text, record }) => {
      return {
        children: h(RefundTicket, {
          status: record?.status,
          refundClick: () => {
            state.visible = true
            state.currentOrder = record?.orderSn
          }
        }),
        props: {
          rowSpan: record?.rowSpan
        }
      }
    }
  }
]

watch(
  () => state.activeKey,
  (newValue) => {
    if (newValue === 0) {
      state.columns = [
        ...columns,
        {
          title: '操作',
          dataIndex: 'edit',
          key: 'edit',
          slots: { customRender: 'edit' },
          customRender: ({ text, record }) => {
            return {
              children: h(EditContent, {
                orderSn: record?.orderSn,
                cancel,
                pay
              }),
              props: {
                rowSpan: record?.rowSpan
              }
            }
          }
        }
      ]
    } else {
      state.columns = columns
    }
  },
  { immediate: true }
)
watch(
  () => state.checkList,
  (val) => {
    state.indeterminate = !!val.length && val.length < state.dataSource.length
    state.checkAll = val.length === state.dataSource.length
  }
)

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
const onCheckAllChange = (e) => {
  const a = state.dataSource.map(
    (item) => String(item.idCard) + String(item.orderSn)
  )
  Object.assign(state, {
    checkList: e.target.checked ? a : [],
    indeterminate: false
  })
}
const handleRefund = () => {
  fetchRefundTicket({
    orderSn: state.currentOrder,
    type: 0,
    subOrderRecordIdReqList: state.refundOrder
  }).then((res) => {
    state.visible = false
    message.success('退款成功')
    getTicketList(state.current, state.size, state.activeKey)
  })
}
</script>

<style lang="scss" scoped>
.card-container {
  overflow: hidden;
}
.tips-txt {
  background: #fffbe5;
  border: 1px solid #fbd800;
  padding: 5px;
  margin-top: 10px;
}

.card-container > .ant-tabs-card > .ant-tabs-content {
  height: 120px;
  margin-top: -16px;
}

.card-container > .ant-tabs-card > .ant-tabs-content > .ant-tabs-tabpane {
  background: #fff;
  /* //   padding: 16px; */
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
  .custom-modal {
    .ant-alert-warning {
      background-color: #fff !important;
      border: none !important;
    }
  }
}
</style>
