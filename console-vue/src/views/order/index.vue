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
          <span class="important-text">{{ '2023-07-09' }}</span>
          <span class="important-text">（{{ '周日' }}）</span>
          <span class="important-text">{{ 'K271' }}</span>
          <span class="small-text">次</span>
          <span class="important-text">{{ '上海南' }}</span>
          <span class="small-text">站</span>
          <span class="important-text">（{{ '17:49' }}开）——</span>
          <span class="important-text">{{ '杭州南' }}</span>
          <span class="small-text">站</span>
          <span class="important-text">（{{ '20:16' }}到）</span>
        </div>
        <Table
          :columns="columns"
          :pagination="false"
          :dataSource="state.currentInfo?.passengerDetails"
        >
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
            {{ text === 0 && '商务座' }}</template
          >
        </Table>

        <!-- <div class="cyx-hd">
          <div class="cyx-hd-label">
            <Checkbox></Checkbox>
            <i class="icon-cyx"></i>
          </div>
          <div class="cyx-hd-text">
            <strong>车上站内|保障意外伤害和急性病事故</strong>
          </div>
          <div class="cyx-hd-text">
            已阅读并同意<a
              id="ins_clause_time"
              target="_blank"
              href="https://kyfw.12306.cn/otn/gonggao/QuestionForInsurance.html?linktypeid=means1"
              >“保险条款”</a
            >

            、<a
              id="ins_notice_time"
              target="_blank"
              href="https://kyfw.12306.cn/otn/gonggao/QuestionForInsurance.html?linktypeid=means2"
              >“投保须知”</a
            >

            和<a
              id="ins_notice_tk"
              target="_blank"
              href="https://kyfw.12306.cn/otn/gonggao/QuestionForInsurance.html?linktypeid=means4"
              >“免责条款”</a
            >
            <br />
            可登陆铁路保险公司官网<a
              target="_blank"
              href="http://www.china-ric.com/"
              >http://www.china-ric.com/</a
            >
            开具电子发票
          </div>
          <div style="display: none" class="cyx-hd-text">
            当前保费成人￥3元/人，儿童￥1元/人，保障意外伤害和急性病身故。
          </div>
        </div> -->
        <div :style="{ width: '100%', textAlign: 'end', padding: '10px' }">
          总票价：<span :style="{ color: '#ff8001' }"
            >{{
              state.currentInfo?.passengerDetails?.reduce(
                (pre, nex) => Number(pre?.amount) + Number(nex?.amount)
              ) &&
              state.currentInfo?.passengerDetails?.reduce(
                (pre, nex) => Number(pre?.amount) + Number(nex?.amount)
              ) / 100
            }}元</span
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
    <div>
      >>应付金额：<span
        :style="{ fontSize: '20px', color: ' #dc2408', fontWeight: 'bold' }"
        >{{
          state.currentInfo?.passengerDetails?.reduce(
            (pre, nex) => Number(pre?.amount) + Number(nex?.amount)
          )
        }}
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
  </Modal>
</template>

<script setup>
import { Card, Space, Table, Divider, Button, Modal } from 'ant-design-vue'
import dayjs from 'dayjs'
import { fetchOrderBySn, fetchPay } from '@/service'
import { useRoute, useRouter } from 'vue-router'
import { onMounted, reactive } from 'vue'
import { TICKET_TYPE_LIST, ID_CARD_TYPE, BANK_LIST } from '@/constants'

const { query } = useRoute()
const router = useRouter()
const state = reactive({
  count: 600000,
  currentInfo: null,
  open: false,
  html: ''
})
const columns = [
  { title: '序号', dataIndex: 'id' },
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
  { title: '票价(元)', dataIndex: 'amount' }
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

const handlePay = (channel) => {
  const body = {
    channel: 0,
    tradeType: 0,
    orderSn: query.sn,
    totalAmount: state.currentInfo?.passengerDetails?.reduce(
      (pre, nex) => Number(pre?.amount) + Number(nex?.amount)
    ),
    outOrderSn: query.orderSn,
    subject: `${state.currentInfo.departure}-${state.currentInfo.arrival}`
  }
  fetchPay(body).then((res) => {
    state.html = res.data?.body
    console.log(res.data?.body)
    setTimeout(() => {
      document.forms[0].submit()
    }, 500)
    // router.push(`/aliPay?body=${res.data?.body}`)
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
