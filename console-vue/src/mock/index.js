import Mock from 'mockjs'
//使用mockjs模拟数据
Mock.mock('/api/login', 'get', () => {
  return {
    status: 10000,
    data: null,
    msg: '登录成功'
  }
})
