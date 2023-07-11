import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/login'
import TicketSearch from '../views/ticket-serach'
import Userinfo from '../views/user-info'
import Passenger from '../views/passenger'
import MyTicket from '../views/my-ticket'
import Order from '../views/order'
import AddPassanger from '../views/add-passenger'
import CheckOrder from '../views/check-order'
import BuyTicket from '../views/buy-ticket'
import AliPay from '../views/ali-pay'
const routes = [
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    label: '车票查询',
    path: '/ticketSearch',
    name: 'ticketSearch',
    component: TicketSearch,
    icon: 'icon-chaxun'
  },
  {
    label: '用户信息',
    path: '/userInfo',
    name: 'userInfo',
    component: Userinfo,
    icon: 'icon-ic_account'
  },
  {
    label: '人员信息',
    path: '/passenger',
    name: 'passenger',
    component: Passenger,
    icon: 'icon-renyuanfenbu'
  },
  {
    label: '我的车票',
    path: '/myTicket',
    name: 'myTicket',
    component: MyTicket,
    icon: 'icon-dingdan'
  },
  {
    label: '我的订单',
    path: '/order',
    name: 'order',
    component: Order,
    icon: 'icon-dingdan'
  },
  {
    label: '添加乘车人',
    path: '/addPassenger',
    name: 'addPassenger',
    component: AddPassanger,
    icon: 'icon-icon-adduser'
  },
  {
    label: '结算',
    path: '/checkOrder',
    name: 'checkOrder',
    component: CheckOrder,
    icon: 'icon-goumai'
  },
  {
    label: '购买车票',
    path: '/buyTicket',
    name: 'buyTicket',
    component: BuyTicket,
    icon: 'icon-goumai'
  },
  {
    label: '支付宝支付',
    path: '/aliPay',
    name: 'aliPay',
    component: AliPay,
    icon: 'icon-zhifubao0'
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export { routes }

export default router
