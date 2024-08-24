<template>
  <Header :class="{ isLogin }">
    <div class="header-wrapper">
      <div>
        <div class="logo">拿个offer-12306铁路购票@马丁</div>
      </div>
      <div>
        <ul class="nav-list-wrapper">
          <router-link to="/ticketSearch">
            <li>首页</li>
          </router-link>
          <a href="https://nageoffer.com/12306" target="_blank">
            <li>文档</li>
          </a>
          <a href="https://nageoffer.com/docs/" target="_blank">
            <li>博客</li>
          </a>
          <a href="https://nageoffer.com/planet" target="_blank">
            <li>社区</li>
          </a>
          <a v-if="route.fullPath !== '/login'">
            <Dropdown :trigger="['click']">
              <li :style="{ padding: '0 0 0 30px' }">
                <Avatar shape="square" style="background-color: #1890ff"
                  >{{ state.username?.slice(0, 1)?.toUpperCase() }}
                </Avatar>
              </li>
              <template #overlay>
                <Menu>
                  <MenuItem>
                    <a @click="() => router.push('/userInfo')">个人信息</a>
                  </MenuItem>
                  <MenuItem>
                    <a @click="() => logout()">退出登录</a>
                  </MenuItem>
                </Menu>
              </template>
            </Dropdown>
          </a>
        </ul>
      </div>
    </div>
  </Header>
</template>

<script setup>
import {
  Layout,
  Avatar,
  Dropdown,
  Menu,
  MenuItem,
  message
} from 'ant-design-vue'
import { useRouter, useRoute } from 'vue-router'
import { defineProps, reactive, toRefs, watch } from 'vue'
import { fetchLogout } from '@/service'
import Cookie from 'js-cookie'
const username = Cookie.get('username')

const { Header } = Layout
const props = defineProps({
  isLogin: Boolean
})

const { isLogin } = toRefs(props)

const state = reactive({
  username: username
})

const router = useRouter()
const route = useRoute()

watch(
  () => route.fullPath,
  (newValue) => {
    state.username = username
  },
  { immediate: true }
)

const logout = () => {
  const token = Cookie.get('token')
  fetchLogout({ accessToken: token }).then((res) => {
    if (res.success) {
      message.success('退出成功')
      location.href = 'login'
      Cookie.remove('token')
      Cookie.remove('username')
    }
  })
}
</script>

<style lang="scss" scoped>
.ant-layout-header {
  position: fixed;
  width: 100%;
  min-width: 800px;
  height: 64px;
  top: 0;
  z-index: 100;
  background-color: #252b30;
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.08);
}

.isLogin.ant-layout-header {
  background-color: transparent;
}

.header-wrapper {
  display: flex;
  flex: 1;
  flex-direction: row;
  justify-content: space-between;
  flex-wrap: nowrap;
  color: rgba(255, 255, 255, 0.8);
}

.logo {
  font-size: 16px;
  font-weight: 600;
  color: #e8e8e8;
  font-family: Helvetica, Tahoma, Arial, 'PingFang SC', 'Hiragino Sans GB', 'Heiti SC', 'Microsoft YaHei', 'WenQuanYi Micro Hei';
  cursor: pointer;
  margin-left: -30px;
}

.logo:hover {
  color: #fff;
}

.nav-list-wrapper {
  display: flex;
  text-decoration: none;
  list-style: none;
  margin: 0;

  a {
    color: rgba(255, 255, 255, 0.8);

    li {
      padding: 0 30px;
    }
    // &:last-child {
    //   padding: 0 0 0 30px;
    // }
  }
}
</style>
