const TICKET_TYPE_LIST = [
  {
    label: '成人票',
    value: 0
  },
  {
    label: '学生票',
    value: 1
  }
]

const DISCOUNTS_TYPE = [
  {
    label: '成人',
    value: 0
  },
  {
    label: '儿童',
    value: 1
  },
  {
    label: '学生',
    value: 2
  },
  {
    label: '残疾军人',
    value: 3
  }
]

const TICKET_STATUS_LIST = [
  {
    label: '待支付',
    value: 0
  },
  {
    label: '已支付',
    value: 10
  },
  {
    label: '已进站',
    value: 20
  },
  {
    label: '已取消',
    value: 30
  },
  {
    label: '已退票',
    value: 40
  },
  {
    label: '已改签',
    value: 50
  }
]

const ID_CARD_TYPE = [
  {
    label: '中国居民身份证',
    value: 0
  }
]

const SEAT_NAME_MAP = [
  {
    0: {
      businessClass: '商务座',
      firstClass: '一等座',
      secondClass: '二等座'
    }
  },
  {
    1: {
      businessClass: '商务座',
      businessClass: '商务座',
      businessClass: '商务座'
    }
  }
]

const SEAT_CLASS_TYPE_LIST = [
  { label: '商务座', code: 0 },
  { label: '一等座', code: 1 },
  { label: '二等座', code: 2 },
  { label: '二等包座', code: 3 },
  { label: '一等卧', code: 4 },
  { label: '二等卧', code: 5 },
  { label: '软卧', code: 6 },
  { label: '硬卧', code: 7 },
  { label: '硬座', code: 8 },
  { label: '高级软卧', code: 9 },
  { label: '动卧', code: 10 },
  { label: '软座', code: 11 },
  { label: '特等座', code: 12 },
  { label: '无座', code: 13 },
  { label: '其他', code: 14 }
]

const TRAIN_BRAND_LIST = [
  { code: 0, label: 'GC-高铁城际' },
  { code: 1, label: 'D-动车' },
  { code: 2, label: 'Z-直达' },
  { code: 3, label: 'T-特快' },
  { code: 4, label: 'K-快速' },
  { code: 5, label: '其他' },
  { code: 6, label: '复兴号' },
  { code: 7, label: '智能动车组' }
]
const BANK_LIST = [
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_zfb.gif',
    name: '支付宝',
    value: 0
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_wx.gif',
    name: '微信',
    value: 1
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_gsyh2.gif',
    name: '工商银行',
    value: 10
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_nyyh2.gif',
    name: '农业银行',
    value: 9
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_zgyh2.gif',
    name: '中国银行',
    value: 8
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_jsyh2.gif',
    name: '建设银行',
    value: 7
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_zsyh2.gif',
    name: '招商银行',
    value: 6
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_ycyh.gif',
    name: '邮储银行',
    value: 5
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_zgyl.gif',
    name: '中国银联',
    value: 4
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_ztytk.gif',
    name: '中铁银通卡',
    value: 3
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_wk.gif',
    name: '国际卡',
    value: 12
  },
  {
    img: 'https://epay.12306.cn/pay/pages/web/images/bank_jtyh.png',
    name: '交通银行',
    value: 13
  }
]

const REGIN_MAP = [
  {
    value: '0',
    label: '中国'
  }
]
const CHECK_STATUS = [
  {
    value: 0,
    label: '通过'
  },
  {
    value: 1,
    label: '未通过'
  }
]
export {
  TICKET_TYPE_LIST,
  SEAT_NAME_MAP,
  ID_CARD_TYPE,
  BANK_LIST,
  SEAT_CLASS_TYPE_LIST,
  TRAIN_BRAND_LIST,
  TICKET_STATUS_LIST,
  DISCOUNTS_TYPE,
  REGIN_MAP,
  CHECK_STATUS
}
