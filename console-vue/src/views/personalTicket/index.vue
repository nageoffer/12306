<template>
  <div style="padding: 20px 0">
    <Form layout="inline">
      <FormItem label="乘车日期"><RangePicker></RangePicker></FormItem>
      <FormItem>
        <Checkbox>学生票</Checkbox>
      </FormItem>
      <Button type="primary" html-type="submit">查询</Button>
    </Form>
  </div>
  <div v-if="!loading" class="list-container">
    <div v-for="item in state.data">
      <BadgeRibbon
        :text="item.ridingDate + getWeekNumber(dayjs(item.ridingDate).day())"
        placement="start"
      >
        <div class="list">
          <div class="list-item-container">
            <div class="train-number">{{ item.trainNumber }}</div>
            <div class="da-container flex2">
              <div class="d-container">
                <div class="city">{{ item.departure }}</div>
                <div class="time">{{ item.departureTime + '开' }}</div>
              </div>
              <div class="arrow-container">
                <SwapRightOutlined style="font-size: 30px; color: #448ef7" />
                <Tag>车次当日有效</Tag>
              </div>
              <div class="d-container">
                <div class="city">{{ item.arrival }}</div>
                <div class="time">{{ item.arrivalTime + '开' }}</div>
              </div>
            </div>
            <div class="d-container">
              <div class="seat">
                {{
                  SEAT_CLASS_TYPE_LIST.find(
                    (seat) => seat.code === item.seatType
                  )?.label
                }}
              </div>
              <div class="carriage">
                {{ item.carriageNumber + '车' + item.seatNumber + '号' }}
              </div>
            </div>
            <div class="flex2">
              <span class="ticket">{{
                DISCOUNTS_TYPE.find(
                  (discout) => discout.value === item.ticketType
                )?.label + '票'
              }}</span>
              <span class="amount">{{ (item.amount / 100)?.toFixed(2) }}</span>
            </div>
            <div style="font-weight: bolder">
              {{
                moment(item?.ridingDate ?? new Date()).isAfter(moment())
                  ? '未出战'
                  : '已出站'
              }}
            </div>
          </div>
          <Divider></Divider>
          <div class="button-container">
            <space>
              <Button disabled>线上购票</Button>
              <Button disabled>非现金支付</Button>
            </space>
            <Space>
              <Button disabled>改签</Button>
              <Button disabled>变更车站</Button>
              <Button disabled>餐饮·特产</Button>
              <Button disabled>打印信息单</Button>
            </Space>
          </div>
        </div>
      </BadgeRibbon>
    </div>
  </div>
  <Spin v-else :spinning="true"></Spin>
  <div style="padding: 10px 0; display: flex; justify-content: end">
    <Pagination
      :current="state.current"
      :total="state.total"
      :page-size="state.size"
      @change="
        (page, size) => {
          state.current = page
          state.size = size
        }
      "
      :show-total="(total) => `共${total}条`"
      :show-size-changer="true"
    ></Pagination>
  </div>
</template>
<script setup>
import {
  Form,
  FormItem,
  DatePicker,
  Checkbox,
  Button,
  BadgeRibbon,
  Tag,
  Divider,
  Space,
  Pagination,
  Spin
} from 'ant-design-vue'
import dayjs from 'dayjs'
import { SwapRightOutlined } from '@ant-design/icons-vue'
import { getWeekNumber } from '@/utils'
import { reactive, watch } from 'vue'
import { fetchMyTicket } from '@/service'
import { SEAT_CLASS_TYPE_LIST, DISCOUNTS_TYPE } from '@/constants'
import moment from 'moment'
const { RangePicker } = DatePicker

const state = reactive({
  data: [],
  total: 100,
  size: 10,
  current: 1,
  loading: false
})
const handleFetchMyTicket = (current, size) => {
  state.loading = true
  fetchMyTicket({ current, size })
    .then((res) => {
      state.data = res.data?.records
      state.total = res.data?.total
      state.loading = false
    })
    .catch(() => (state.loading = false))
}

watch(
  () => [state.current, state.size],
  (newValue) => {
    state.loading = true
    const [current, size] = newValue
    handleFetchMyTicket(current, size)
  },
  { immediate: true }
)
</script>
<style lang="scss" scoped>
.list-container {
  /* width: 80%; */
  margin: 0 auto;

  .list {
    background-color: #fff;
    .button-container {
      display: flex;
      justify-content: space-between;
      padding: 15px 5px;
    }
    .list-item-container {
      display: flex;
      width: 100%;
      /* background-color: #fff; */
      margin: 10px 0;
      padding: 15px 5px;
      align-items: center;
      > div {
        padding: 0 10px;
        margin-right: 20px;
        flex: 1;
        text-align: center;
      }
      .train-number {
        font-size: 16px;
        font-weight: bolder;
      }
      .flex2 {
        flex: 2;
        .ticket {
          font-weight: bolder;
          margin-right: 10px;
        }
        /* .amount {
        color: #ef8a36;
        &::before {
          content: '¥';
          color: #ef8a36;
        }
      } */
      }
      .da-container {
        display: flex;
        justify-content: space-between;
        .arrow-container {
          display: flex;
          flex-direction: column;
        }
        .d-container {
          display: flex;
          flex-direction: column;
          align-items: center;
          .city {
            font-weight: bolder;
            margin-bottom: 10px;
          }
          .seat {
            font-weight: border;
            margin-bottom: 10px;
          }
        }
      }
      .d-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        .seat {
          font-weight: bolder;
          margin-bottom: 10px;
        }
      }
    }
  }
}
::v-deep {
  .ant-divider-horizontal {
    margin: 15px 0 0;
  }
}
</style>
