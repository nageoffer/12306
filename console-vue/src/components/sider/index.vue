<template>
  <div
    :style="{
      position: 'relative',
      minWidth: !state.collapse ? '200px' : '80px',
      height: 'calc(100vh - 64px)'
    }"
  >
    <Sider
      :collapsed="state.collapse"
      collapsible
      :trigger="null"
      @collapse="() => (state.collapse = !state.collapse)"
    >
      <Menu v-model:selectedKeys="selectedKeys" mode="inline">
        <SubMenu key="sub1" @titleClick="titleClick">
          <template #icon>
            <IconFont type="icon-icon_yingyongguanli" />
          </template>
          <template #title>车票管理 </template>
          <Item key="ticketSearch"
            ><RouterLink to="/ticketSearch">车票查询</RouterLink></Item
          >
        </SubMenu>
        <SubMenu key="sub2" @titleClick="titleClick">
          <template #icon>
            <IconFont type="icon-pingtaixinxiguanli" />
          </template>
          <template #title>常用信息管理</template>
          <Item key="userInfo"
            ><RouterLink to="/userInfo">个人信息</RouterLink></Item
          >
          <Item key="passenger"
            ><RouterLink to="/passenger">乘车人</RouterLink></Item
          >
        </SubMenu>
        <SubMenu key="sub4" @titleClick="titleClick">
          <template #icon>
            <IconFont type="icon-dingdan" />
          </template>
          <template #title>订单管理</template>
          <Item key="order"
            ><RouterLink to="/ticketList">车票订单</RouterLink>
          </Item>
          <Item key="personalTicket">
            <RouterLink to="/personalTicket">本人车票</RouterLink>
          </Item>
        </SubMenu>
      </Menu>
    </Sider>
    <div
      class="sider-footer"
      :style="{
        width: !state.collapse ? '200px' : '80px'
      }"
    >
      <Tooltip title="折起">
        <div
          :class="state.collapse && 'collaspe-icon'"
          @click="() => (state.collapse = !state.collapse)"
          class="icon-wrapper"
        >
          <IconFont type="icon-zhedie" /></div
      ></Tooltip>
      <Divider v-if="!state.collapse" type="vertical" />
      <Tooltip title="退出登录">
        <div @click="logout" v-if="!state.collapse" class="icon-wrapper">
          <IconFont type="icon-tuichudenglu" />
        </div>
      </Tooltip>
    </div>
  </div>
</template>

<script setup>
import { defineProps, reactive } from 'vue'
import IconFont from '@/components/icon-font'
import { Layout, Menu, Divider, message, Tooltip } from 'ant-design-vue'
import { fetchLogout } from '@/service'
import { RouterLink } from 'vue-router'
import Cookie from 'js-cookie'
const { SubMenu, Item } = Menu
const { Sider } = Layout
const props = defineProps({
  isLogin: Boolean
})

const state = reactive({
  collapse: false
})
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
.ant-layout-sider {
  position: fixed;
  left: 0;
  top: 64px;
  height: calc(100vh - 64px);
  background-color: #e6e9ee;
  transition: none;
}
.sider-footer {
  position: fixed;
  z-index: 100;
  bottom: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: space-around;
  padding: 18px;
  align-items: center;
  .icon-wrapper {
    cursor: pointer;
  }
  .collaspe-icon {
    transform: rotate(180deg);
  }
}
::v-deep {
  .ant-menu {
    background-color: #e6e9ee;
    color: #686868;
  }
  .ant-menu-sub.ant-menu-inline {
    background: #e6e9ee;
  }
  .ant-menu:not(.ant-menu-horizontal) .ant-menu-item-selected {
    background: #f2f3f7;
  }
  .ant-menu-submenu-selected {
    color: #686868;
  }
  .ant-menu-item-selected {
    color: #686868;
  }
  .ant-menu-item-active {
    color: #686868;
  }
  .ant-menu-submenu-active {
    color: #686868;
  }
  .ant-menu-light .ant-menu-item:hover {
    color: #686868;
  }
  .ant-menu-submenu:hover {
    color: #686868;
  }
  .ant-menu-inline .ant-menu-item::after {
    border-right: none;
  }
  .ant-menu-light .ant-menu-submenu-title:hover {
    color: #686868;
  }
  .ant-menu-submenu:hover > .ant-menu-submenu-title > .ant-menu-submenu-arrow {
    color: #686868;
  }
  .ant-menu-submenu-arrow {
    color: #686868;
  }
  .ant-menu-title-content {
    user-select: none;
  }
  .ant-menu-item-group-title {
    user-select: none;
  }
}
</style>
