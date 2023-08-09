import { message } from 'ant-design-vue'
import Axios from 'axios'
import Cookie from 'js-cookie'

if (Cookie.get('token')) {
}

const initAxios = Axios.create({
  timeout: 1800000 //数据响应过期时间
  // baseURL: 'http://12306-rd.magestack.cn:9000'
  // headers: ['Authorization', Cookie.get('token') ?? null]
})

//请求拦截器
initAxios.interceptors.request.use(
  (config) => {
    //在发送之前做点什么
    return config
  },
  (error) => {
    //对请求错误做点什么
    return error
  }
)

//响应拦截器
initAxios.interceptors.response.use(
  (response) => {
    if (response.code === 401) {
      message.error('用户未登录或已过期！')
      // location.href = '/login'
      window.location.href = 'login'
    }
    return response
  },
  (error) => {
    console.log(error, 'error')
    if (error.response.status === 401) {
      message.error('用户未登录或已过期！')
      window.location.href = 'login'
    }
    return Promise.reject(error)
  }
)

// const http = Axios()

export default initAxios
