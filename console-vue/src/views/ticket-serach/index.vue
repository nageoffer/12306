<script setup>
import { reactive, toRaw, ref, h, watch, onMounted } from 'vue'
import {
  Card,
  Form,
  FormItem,
  Space,
  Select,
  Button,
  TabPane,
  Tabs,
  DatePicker,
  Table,
  Checkbox,
  CheckboxGroup,
  CheckableTag,
  Row,
  Col,
  Alert,
  Tooltip,
  message
} from 'ant-design-vue'
import { RetweetOutlined, SwapRightOutlined } from '@ant-design/icons-vue'
import dayjs from 'dayjs'
import { getWeekNumber, getTicketNumber } from '@/utils'
import {
  fetchTicketSearch,
  fetchStationAll,
  fetchTrainStation
} from '@/service/index'
import { SEAT_CLASS_TYPE_LIST, TRAIN_BRAND_LIST, TRAIN_TAG } from '@/constants'

const useForm = Form.useForm

const carRangeTime = [
  { value: 0, label: '00:00-24:00' },
  { value: 1, label: '00:00-06:00' },
  { value: 2, label: '06:00-12:00' },
  { value: 3, label: '12:00-18:00' },
  { value: 4, label: '18:00-24:00' }
]

const headSearch = reactive({
  fromStation: 'BJP',
  toStation: 'HZH',
  departureDate: dayjs(),
  arrival_date: '',
  car_type: [],
  departure_stations: [],
  arrival_stations: [],
  departure: [],
  arrival: [],
  seat: []
})

const state = reactive({
  seatClassTypeListSelect: null,
  trainBrandListSelect: null,
  trainList: [],
  stationList: [],
  trainStationList: [],
  loading: false
})

const rowState = reactive({
  rawTrainList: []
})

watch(headSearch, (newValue) => {
  state.trainList = rowState.rawTrainList
  if (newValue?.car_type?.length) {
    state.trainList = state.trainList.filter((item) => {
      const list = item.trainBrand?.split(',')
      let hasInculude = false
      for (let i of list) {
        if (newValue?.car_type?.includes(i * 1)) {
          hasInculude = true
        }
      }
      return hasInculude
    })
  }
  if (newValue?.departure?.length) {
    state.trainList = state.trainList.filter((item) => {
      return newValue?.departure?.includes(item.departure)
    })
  }
  if (newValue?.arrival?.length) {
    state.trainList = state.trainList.filter((item) => {
      return newValue?.arrival?.includes(item.arrival)
    })
  }
  if (newValue?.seat?.length) {
    state.trainList = state.trainList.filter((item) => {
      const list =
        item.seatClassList?.filter(
          (item) => newValue.seat.includes(item.type) && item.quantity
        ) ?? []
      console.log('newValue.seat:::', newValue.seat)
      console.log('item.seatClassList:::', item.seatClassList)
      console.log('list:::', list)
      return list.length
    })
  }
})

const currCityStations = ref([])
const currArrivalStations = ref([])
const checkTagCardType = ref(false)
const departureTagAll = ref(false)
const arrivalTagAll = ref(false)
const seatTagAll = ref(false)

const columns = [
  {
    title: '车次',
    dataIndex: 'trainNumber',
    slots: { customRender: 'trainNumber' },
    key: 'trainNumber',
    width: 100,
    // ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    key: 'station',
    slots: { title: 'customStaionTitle', customRender: 'station' },
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'left'
  },
  {
    dataIndex: 'time',
    key: 'time',
    slots: { title: 'customTimeTitle', customRender: 'time' },
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '历时',
    dataIndex: 'duration',
    key: 'duration',
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'seat',
    slots: { title: 'customSeatTitle', customRender: 'highSpeedTrain' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '一等座',
    dataIndex: 'seatClassList',
    slots: { customRender: 'firstSeat' },
    key: 'first_seat',
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'second_seat',
    slots: { title: 'customSecondSeatTitle', customRender: 'secondSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '动卧',
    dataIndex: 'seatClassList',
    key: 'bed',
    slots: { customRender: 'bed' },
    width: 80,
    ellipsis: true,
    resizeble: false
  },
  {
    title: '高级软卧',
    dataIndex: 'seatClassList',
    key: 'delux_soft_bed',
    slots: { customRender: 'deluxSoftBed' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'first_bed',
    slots: { title: 'customFirstBedSeatTitle', customRender: 'firstBed' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'scond_hard_bed',
    slots: { title: 'customScondHardSeadTitle', customRender: 'scondHardBed' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '软座',
    dataIndex: 'seatClassList',
    key: 'first_soft_seat',
    slots: { customRender: 'firstSoftSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '硬座',
    dataIndex: 'seatClassList',
    key: 'hard_seat',
    slots: { customRender: 'hardSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '无座',
    dataIndex: 'seatClassList',
    key: 'no_seat',
    slots: { customRender: 'noSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '其他',
    dataIndex: 'seatClassList',
    key: 'other',
    slots: { customRender: 'other' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '备注',
    dataIndex: 'remark',
    slots: { customRender: 'operation' },
    align: 'center'
  }
]

const innerColumns = [
  {
    title: '车次',
    key: 'trainNumber',
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '车站',
    key: 'station',
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '时间',
    key: 'time',
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '历时',
    key: 'duration',
    width: 100,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'seat',
    slots: { title: 'customSeatTitle', customRender: 'highSpeedTrainPrice' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '一等座',
    dataIndex: 'seatClassList',
    slots: { customRender: 'firstSeatPrice' },
    key: 'first_seat',
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'second_seat',
    slots: { title: 'customSecondSeatTitle', customRender: 'secondSeatPrice' },

    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '动卧',
    dataIndex: 'seatClassList',
    key: 'bed',
    slots: { customRender: 'bedPrice' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '高级软卧',
    dataIndex: 'seatClassList',
    key: 'delux_soft_bed',
    slots: { customRender: 'deluxSoftBedPrice' },
    width: 90,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'first_bed',
    slots: { title: 'customFirstBedSeatTitle', customRender: 'firstBed' },

    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    dataIndex: 'seatClassList',
    key: 'scond_hard_bed',
    slots: {
      title: 'customScondHardSeadTitle',
      customRender: 'scondHardBedPrice'
    },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '软座',
    dataIndex: 'seatClassList',
    key: 'first_soft_seat',
    slots: { customRender: 'firstSoftSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '硬座',
    dataIndex: 'seatClassList',
    key: 'hard_seat',
    slots: { customRender: 'hardSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '无座',
    dataIndex: 'seatClassList',
    key: 'no_seat',
    slots: { customRender: 'noSeat' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '其他',
    dataIndex: 'other',
    key: 'other',
    slots: { customRender: 'other' },
    width: 80,
    ellipsis: true,
    resizeble: false,
    align: 'center'
  },
  {
    title: '备注',
    dataIndex: 'remark',
    slots: { customRender: 'operation' },
    fixed: 'right',
    align: 'center'
  }
]

const cardInfoColumns = [
  {
    title: '站序',
    dataIndex: 'sequence',
    key: 'sequence'
  },
  {
    title: '站名',
    dataIndex: 'departure',
    key: 'departure'
  },
  {
    title: '到站时间',
    dataIndex: 'arrivalTime',
    key: 'arrivalTime'
  },
  {
    title: '出发时间',
    dataIndex: 'departureTime',
    key: 'departureTime'
  },
  {
    title: '停留时间',
    dataIndex: 'stopoverTime',
    key: 'stopoverTime'
  }
]

const { resetFields, validate } = useForm(headSearch)

const days = new Array(15)
  .fill(',')
  .map((item, index) => dayjs().add(index, 'days'))

const handSubmit = () => {
  validate().then(() => {
    const { fromStation, toStation, departure, arrival, departureDate } =
      toRaw(headSearch)
    fetchTicketSearch({
      fromStation,
      toStation,
      departure: departure[0],
      arrival: arrival[0],
      departureDate: departureDate.format('YYYY-MM-DD')
    }).then((res) => {
      if (!res.success) return message.error(res.message)
      if (res.data.trainList) {
        state.trainList = res.data.trainList?.map((item) => ({
          ...item,
          key: item.trainId
        }))
        rowState.rawTrainList = res.data.trainList?.map((item) => ({
          ...item,
          key: item.trainId
        }))
      }
      state.trainBrandListSelect = res.data.trainBrandList
      state.seatClassTypeListSelect = res.data.seatClassTypeList
      currCityStations.value = res.data.departureStationList
      currArrivalStations.value = res.data.arrivalStationList
    })
  })
}

const getTitle = (item) => {
  const key = item.format('MM-DD')
  if (key === headSearch.departureDate.format('MM-DD')) {
    return key + '　' + getWeekNumber(item.day())
  } else {
    return key
  }
}

const getStationAll = () => {
  fetchStationAll().then((res) => {
    state.stationList = res.data
  })
}

const handlePriceShow = (price) => {
  if (price) {
    return '￥' + price
  } else {
    return ''
  }
}

onMounted(() => {
  fetchTicketSearch({
    fromStation: headSearch.fromStation,
    toStation: headSearch.toStation,
    departureDate: dayjs(new Date()).format('YYYY-MM-DD')
  }).then((res) => {
    if (!res.success) return message.error(res.message)
    if (res.data.trainList) {
      state.trainList = res.data.trainList?.map((item) => ({
        ...item,
        key: item.trainId
      }))
      rowState.rawTrainList = res.data.trainList?.map((item) => ({
        ...item,
        key: item.trainId
      }))
    }
    state.trainBrandListSelect = res.data.trainBrandList
    state.seatClassTypeListSelect = res.data.seatClassTypeList
    currCityStations.value = res.data.departureStationList
    currArrivalStations.value = res.data.arrivalStationList
  })
  getStationAll()
})

const exchangeCity = () => {
  const [a, b] = [toRaw(headSearch.fromStation), toRaw(headSearch.toStation)]
  console.log(a, b)

  headSearch.fromStation = b
  headSearch.toStation = a
}

const handleTrainClick = (trainId) => {
  fetchTrainStation({ trainId }).then((res) => {
    state.trainStationList = res.data
    state.loading = false
  })
}

const handleBook = (record) => {
  window.open(
    `buyTicket?trainNumber=${record.trainNumber}&&trainId=${
      record.trainId
    }&&${Object.entries(headSearch)
      ?.map((item) => {
        return `${item[0]}=${
          item[0] === 'departureDate' ? item[1].format('YYYY-MM-DD') : item[1]
        }`
      })
      .join('&&')}`
  )
}
</script>
<template>
  <div>
    <Space direction="vertical" size="middle" :style="{ width: '100%' }">
      <Form
        layout="inline"
        :colon="false"
        :label-col="{ span: 8 }"
        :wrapper-col="{ span: 16 }"
      >
        <Space direction="vertical" size="middle" :style="{ width: '100%' }">
          <Card
            :style="{
              width: '100%'
            }"
          >
            <Row :style="{ maxWidth: '1150px' }">
              <Col :span="5">
                <FormItem label="出发地">
                  <Select
                    v-model:value="headSearch.fromStation"
                    :style="{ width: '150px' }"
                    :show-arrow="false"
                    :show-search="true"
                    :options="
                      state.stationList.map((item) => ({
                        label: item.name,
                        value: item.code
                      }))
                    "
                  >
                  </Select>
                </FormItem>
              </Col>
              <Col
                :span="2"
                :style="{
                  display: 'flex'
                }"
              >
                <div
                  :style="{
                    width: '100%',
                    textAlign: 'center',
                    alignItems: 'center',
                    lineHeight: '32px'
                  }"
                >
                  <RetweetOutlined
                    @click="exchangeCity"
                    :style="{
                      cursor: 'pointer',
                      fontSize: '20px',
                      color: '#1990ff'
                    }"
                  /></div
              ></Col>
              <Col :span="5">
                <FormItem label="目的地">
                  <Select
                    v-model:value="headSearch.toStation"
                    :style="{ width: '150px' }"
                    :show-arrow="false"
                    :show-search="true"
                    :options="
                      state.stationList.map((item) => ({
                        label: item.name,
                        value: item.code
                      }))
                    "
                  >
                  </Select>
                </FormItem>
              </Col>
              <Col :span="5">
                <FormItem label="出发日">
                  <DatePicker
                    v-model:value="headSearch.departureDate"
                    :style="{ width: '150px' }"
                    :show-arrow="false"
                    :allow-clear="false"
                  >
                  </DatePicker>
                </FormItem>
              </Col>
              <Col span="2">
                <FormItem>
                  <Button
                    type="primary"
                    @click="
                      () => {
                        handSubmit()
                      }
                    "
                    >查询</Button
                  >
                </FormItem>
              </Col>
            </Row>
          </Card>
          <div class="card-container">
            <Tabs
              type="card"
              :default-active-key="headSearch.departureDate.format('MM-DD')"
              :key="headSearch.departureDate.format('MM-DD')"
              @change="
                (value) => {
                  const year = dayjs().format('YYYY')
                  const date = year + value
                  headSearch.departureDate = dayjs(date)
                }
              "
            >
              <TabPane
                v-for="item in days"
                :key="item.format('MM-DD')"
                :tab="getTitle(item)"
              >
                <Card flex :bordered="false">
                  <Row justify="space">
                    <Col :span="20" flex>
                      <FormItem>
                        <template v-slot:label>
                          <span class="spacial-label">车次类型</span>
                        </template>
                        <CheckboxGroup
                          :value="headSearch.car_type"
                          @change="
                            (value) => {
                              checkTagCardType =
                                value.length ===
                                state.trainBrandListSelect.length
                              headSearch.car_type = value
                            }
                          "
                        >
                          <CheckableTag
                            :checked="checkTagCardType"
                            @change="
                              (value) => {
                                checkTagCardType = value
                                if (value) {
                                  headSearch.car_type =
                                    state.trainBrandListSelect
                                } else {
                                  headSearch.car_type = []
                                }
                              }
                            "
                            :style="{
                              border: '1px solid #f0f0f0',
                              marginRight: '10px'
                            }"
                            >全部</CheckableTag
                          >
                          <Checkbox
                            v-for="seatItem in state.trainBrandListSelect"
                            :value="
                              TRAIN_BRAND_LIST.find(
                                (item) => item.code === seatItem
                              )?.code
                            "
                            >{{
                              TRAIN_BRAND_LIST.find(
                                (item) => item.code === seatItem
                              )?.label
                            }}</Checkbox
                          >
                        </CheckboxGroup>
                      </FormItem>
                      <FormItem>
                        <template v-slot:label>
                          <span class="spacial-label">出发车站</span>
                        </template>
                        <CheckboxGroup
                          :value="headSearch.departure"
                          @change="
                            (value) => {
                              departureTagAll =
                                value.length === currCityStations.length
                              headSearch.departure = value
                            }
                          "
                        >
                          <CheckableTag
                            :style="{
                              border: '1px solid #f0f0f0',
                              marginRight: '10px'
                            }"
                            :checked="departureTagAll"
                            @change="
                              (value) => {
                                departureTagAll = value
                                if (value) {
                                  headSearch.departure = currCityStations
                                } else {
                                  headSearch.departure = []
                                }
                              }
                            "
                            >全部</CheckableTag
                          >
                          <Checkbox
                            v-for="item in currCityStations"
                            :value="item"
                            >{{ item }}</Checkbox
                          >
                        </CheckboxGroup>
                      </FormItem>
                      <FormItem>
                        <template v-slot:label>
                          <span class="spacial-label">到达车站</span>
                        </template>
                        <CheckboxGroup
                          :value="headSearch.arrival"
                          @change="
                            (value) => {
                              arrivalTagAll =
                                value.length === currArrivalStations.length
                              headSearch.arrival = value
                            }
                          "
                        >
                          <CheckableTag
                            :checked="arrivalTagAll"
                            :style="{
                              border: '1px solid #f0f0f0',
                              marginRight: '10px'
                            }"
                            @change="
                              (value) => {
                                arrivalTagAll = value
                                if (value) {
                                  headSearch.arrival = currArrivalStations
                                } else {
                                  headSearch.arrival = []
                                }
                              }
                            "
                            >全部</CheckableTag
                          >
                          <Checkbox
                            v-for="item in currArrivalStations"
                            :value="item"
                            >{{ item }}</Checkbox
                          >
                        </CheckboxGroup>
                      </FormItem>
                      <FormItem>
                        <template v-slot:label>
                          <span class="spacial-label">车次席别</span>
                        </template>
                        <CheckboxGroup
                          :style="{ minWidth: '300px', textWrap: 'nowrap' }"
                          :value="headSearch.seat"
                          @change="
                            (value) => {
                              seatTagAll =
                                value.length ===
                                state.seatClassTypeListSelect.length
                              headSearch.seat = value
                            }
                          "
                        >
                          <CheckableTag
                            :checked="seatTagAll"
                            @change="
                              (value) => {
                                seatTagAll = value
                                if (value) {
                                  headSearch.seat =
                                    state.seatClassTypeListSelect
                                } else {
                                  headSearch.seat = []
                                }
                              }
                            "
                            :style="{
                              border: '1px solid #f0f0f0',
                              marginRight: '10px'
                            }"
                            >全部</CheckableTag
                          >
                          <Checkbox
                            v-for="seatItem in state.seatClassTypeListSelect"
                            :value="
                              SEAT_CLASS_TYPE_LIST.find(
                                (item) => item.code === seatItem
                              )?.code
                            "
                            >{{
                              SEAT_CLASS_TYPE_LIST.find(
                                (item) => item.code === seatItem
                              )?.label
                            }}</Checkbox
                          >
                        </CheckboxGroup>
                      </FormItem>
                    </Col>
                    <Col
                      :span="4"
                      style="
                         {
                          text-align: 'end';
                        }
                      "
                    >
                      <FormItem label="发车时间">
                        <Select
                          dropdownClassName="custom-select"
                          :default-value="0"
                          :options="
                            carRangeTime.map((item) => ({
                              label: item.label,
                              value: item.value
                            }))
                          "
                        />
                      </FormItem>
                    </Col>
                  </Row>
                </Card>
              </TabPane>
            </Tabs>
          </div>
        </Space>
      </Form>
      <Row>
        <Col :span="12">
          <span class="city-name">
            {{
              state.stationList.find(
                (item) => item.code === headSearch.fromStation
              )?.name
            }}
          </span>
          <SwapRightOutlined />
          <span class="city-name">
            {{
              state.stationList.find(
                (item) => item.code === headSearch.toStation
              )?.name
            }}
          </span>

          （<span class="time-title">{{
            headSearch.departureDate.format('MM月DD日')
          }}</span>
          <span class="time-title">{{
            getWeekNumber(headSearch.departureDate.day())
          }}</span
          >） 共计<span :style="{ fontWeight: 'bolder' }">{{
            state.trainList?.length
          }}</span
          >个车次
        </Col>
      </Row>
      <div class="custome-table">
        <Table
          :columns="columns"
          :data-source="state.trainList"
          :pagination="false"
        >
          >
          <template #expandedRowRender="{ record }">
            <Table
              :show-header="false"
              :pagination="false"
              :columns="innerColumns"
              :data-source="[record]"
            >
              <template #highSpeedTrainPrice="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    // (text?.find((item) => item?.type === 0)?.price ||
                    //   '￥' + text?.find((item) => item?.type === 12)?.price) ??
                    // ''
                    handlePriceShow(
                      text?.find((item) => item?.type === 0)?.price ??
                        text.find((item) => item?.type === 12)?.price
                    )
                  }}
                </div>
              </template>
              <template #firstSeatPrice="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 1)?.price
                    )
                  }}
                </div>
              </template>
              <template #secondSeatPrice="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 2)?.price ??
                        text?.find((item) => item.type === 3)?.price
                    )
                  }}
                </div>
              </template>
              <template #bedPrice="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 10)?.price
                    )
                  }}
                </div>
              </template>
              <template #deluxSoftBedPrice="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 9)?.price
                    )
                  }}
                </div>
              </template>
              <template #firstBed="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 6)?.price ??
                        text?.find((item) => item?.type === 4)?.price
                    )
                  }}
                </div>
              </template>
              <template #scondHardBedPrice="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 7)?.price ??
                        text?.find((item) => item?.type === 5)?.price
                    )
                  }}
                </div>
              </template>
              <template #firstSoftSeat="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      item?.find((item) => item?.type === 11)?.price
                    )
                  }}
                </div>
              </template>
              <template #hardSeat="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 8)?.price
                    )
                  }}
                </div>
              </template>
              <template #noSeat="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 13)?.price
                    )
                  }}
                </div>
              </template>
              <template #other="{ text }">
                <div :style="{ color: '#fc8302' }">
                  {{
                    handlePriceShow(
                      text?.find((item) => item?.type === 14)?.price
                    )
                  }}
                </div>
              </template>
            </Table>
          </template>
          <template #trainNumber="{ text, record }">
            <h1
              class="card-name"
              :style="{
                cursor: 'pointer'
              }"
              @click="
                () => {
                  state.loading = true
                  handleTrainClick(record.trainId)
                }
              "
            >
              <Tooltip
                :get-popup-container="(node) => node.parentNode"
                placement="rightTop"
                trigger="click"
              >
                <div>
                  {{ text }}
                </div>
                <div
                  style="
                    display: flex;
                    font-size: 10px;
                    font-weight: bold;
                    width: 100%;
                    line-height: unset;
                    justify-content: center;
                  "
                >
                  <div
                    v-for="tag in record?.trainTags"
                    :style="{
                      color: TRAIN_TAG.find((item) => item.value === tag)
                        ?.color,
                      border: `1px solid ${
                        TRAIN_TAG.find((item) => item.value === tag)?.color
                      }`,
                      padding: '2px',
                      aspectRatio: '1 / 1',
                      borderRadius: '2px',
                      marginRight: '4px'
                    }"
                  >
                    {{ TRAIN_TAG.find((item) => item.value === tag)?.label }}
                  </div>
                </div>
                <template #title>
                  <Table
                    :columns="cardInfoColumns"
                    :data-source="state.trainStationList"
                    :pagination="false"
                    :loading="state.loading"
                  ></Table> </template
              ></Tooltip>
            </h1>
          </template>
          <template #station="{ _, record }">
            <div>
              <span
                :style="{
                  display: 'inline-block',
                  padding: '2px 4px',
                  backgroundColor: record.departureFlag ? '#cca567' : '#7597d5',
                  color: '#fff',
                  borderRadius: '4px',
                  fontSize: '10px',
                  fontWeight: 'bolder',
                  marginRight: '2px'
                }"
                >{{ record.departureFlag ? '始' : '过' }}</span
              >{{ record.departure }}
            </div>
            <div>
              <span
                :style="{
                  display: 'inline-block',
                  padding: '2px 4px',
                  backgroundColor: record.arrivalFlag ? '#6da77f' : '#7597d5',
                  color: '#fff',
                  borderRadius: '4px',
                  fontSize: '10px',
                  fontWeight: 'bolder',
                  marginRight: '2px'
                }"
                >{{ record.arrivalFlag ? '终' : '过' }}</span
              >{{ record.arrival }}
            </div>
          </template>
          <template #customStaionTitle>
            <div>出发站</div>
            <div>到达站</div>
          </template>
          <template #time="{ _, record }">
            <div>
              {{ record.departureTime }}
            </div>
            <div>{{ record.arrivalTime }}</div>
          </template>
          <template #highSpeedTrain="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 0)?.quantity ??
                    text?.find((item) => item?.type === 12)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 0)?.quantity
                )?.label ??
                getTicketNumber(
                  text?.find((item) => item?.type === 12)?.quantity
                )?.label ??
                '--'
              }}
            </div>
          </template>
          <template #firstSeat="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 1)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 1)?.quantity
                )?.label ?? '--'
              }}
            </div>
          </template>
          <template #secondSeat="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 2)?.quantity ??
                    text?.find((item) => item?.type === 3)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 2)?.quantity
                )?.label ??
                getTicketNumber(
                  text?.find((item) => item?.type === 3)?.quantity
                )?.label ??
                '--'
              }}
            </div>
          </template>
          <template #bed="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 10)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 10)?.quantity
                )?.label ?? '--'
              }}
            </div>
          </template>
          <template #deluxSoftBed="{ text }">
            <div>
              {{ text?.find((item) => item?.type === 9)?.quantity ?? '--' }}
            </div>
          </template>
          <template #firstBed="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 6)?.quantity ??
                    text?.find((item) => item?.type === 4)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 6)?.quantity
                )?.label ??
                getTicketNumber(
                  text?.find((item) => item?.type === 4)?.quantity
                )?.label ??
                '--'
              }}
            </div>
          </template>
          <template #scondHardBed="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 7)?.quantity ??
                    text?.find((item) => item?.type === 5)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 7)?.quantity
                )?.label ??
                getTicketNumber(
                  text?.find((item) => item?.type === 5)?.quantity
                )?.label ??
                '--'
              }}
            </div>
          </template>
          <template #firstSoftSeat="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 11)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 11)?.quantity
                )?.label ?? '--'
              }}
            </div>
          </template>
          <template #hardSeat="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 8)?.quantity
                )?.color
              }"
            >
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 8)?.quantity
                )?.label ?? '--'
              }}
            </div>
          </template>
          <template #noSeat="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 13)?.quantity
                )?.color
              }"
            >
              <!-- {{ text?.find((item) => item?.type === 13)?.quantity ?? '--' }} -->
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 13)?.quantity
                )?.label ?? '--'
              }}
            </div>
          </template>
          <template #other="{ text }">
            <div
              :style="{
                color: getTicketNumber(
                  text?.find((item) => item?.type === 14)?.quantity
                )?.color
              }"
            >
              <!-- {{ text?.find((item) => item?.type === 14)?.quantity ?? '--' }} -->
              {{
                getTicketNumber(
                  text?.find((item) => item?.type === 14)?.quantity
                )?.label ?? '--'
              }}
            </div>
          </template>
          <template #customTimeTitle>
            <div>出发时间</div>
            <div>到达时间</div>
          </template>
          <template #customSecondSeatTitle>
            <div>二等座</div>
            <div>二等包座</div>
          </template>
          <template #customSeatTitle>
            <div>商务座</div>
            <div>特等座</div>
          </template>
          <template #customScondHardSeadTitle>
            <div>硬卧</div>
            <div>二等卧</div>
          </template>
          <template #customFirstBedSeatTitle>
            <div>软卧</div>
            <div>一等卧</div>
          </template>
          <template #operation="{ text, record }">
            <Button
              type="link"
              size="small"
              @click="
                () => {
                  handleBook(record)
                }
              "
              :disabled="
                !record.seatClassList.filter((item) => item.quantity)?.length
              "
              >预定</Button
            >
          </template></Table
        >
      </div>
      <Alert type="warning"
        ><template #description>
          <div>
            如果查询结果中没有满足需求的车次，您还可以使用中转换乘功能，查询途中换乘一次的部分列车余票情况。
          </div>
          <div>
            显示的卧铺票价均为上铺票价，供您参考。具体票价以您确认支付时实际购买的铺别票价为准。如因运力原因或者其他不可控因素导致列车调度调整时，当前车型可能会发生变动
          </div>
        </template>
      </Alert>
    </Space>
  </div>
</template>
<style lang="scss" scoped>
.card-container {
  border: 1px solid #1890ff;
  background: #fff;
  overflow: hidden;
  padding: 0;
  border-radius: 4px;
}
.spacial-label {
  font-weight: bolder;
}
.city-name {
  display: inline-block;
  padding: 0 10px;
  font-weight: bolder;
}
.time-title {
  display: inline-block;
  padding: 0 5px;
  font-weight: bolder;
}

::v-deep {
  .custom-select {
    .ant-select-item-option-active::before {
      content: '√';
    }
  }
  .ant-tooltip-inner {
    background-color: #fff;
    padding: 0px;
    width: 500px;
  }
  .ant-tooltip-arrow-content {
    background-color: #1890ff;
  }
  .ant-table-thead {
    .ant-table-cell {
      background: url(https://kyfw.12306.cn/otn/resources/images/bg_tlisthd.png)
        top repeat-x;
      background-size: cover;
    }
  }
  .ant-tabs {
    border: 1px solid #f0f0f0;
    border-top: none;
  }
  .ant-form {
    align-items: center;
    justify-content: space-between;
  }
  .ant-divider-vertical {
    height: 100%;
  }
  .ant-tabs-card.ant-tabs-top > .ant-tabs-nav .ant-tabs-tab + .ant-tabs-tab {
    margin-left: 0;
  }
  .ant-tabs-card > .ant-tabs-nav .ant-tabs-tab {
    /* // border-right: none; */
  }
  .ant-tabs-nav-wrap {
    width: 100%;

    .ant-tabs-nav-list {
      width: 100%;
      .ant-tabs-tab:first-child {
        border-left: none;
      }
      .ant-tabs-tab {
        /* // flex: 1; */
        width: 6.5%;
        text-align: center;
        border-top-left-radius: 0px !important;
        border-top-right-radius: 0px !important;
        .ant-tabs-tab-btn {
          width: 100%;
          text-align: center;
        }
      }

      .ant-tabs-tab.ant-tabs-tab-active {
        // border: 1px solid #1890ff;
        flex-grow: 1.5;
      }
    }
  }
}
::v-deep(.custome-table) {
  .ant-table-thead > tr > th {
    color: #fff;
  }
}
</style>
