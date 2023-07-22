<template>
  <Header :class="{ isLogin }">
    <div class="header-wrapper">
      <div>
        <img
          @click="router.push('/ticketSearch')"
          class="logo"
          src="../../assets/logo.png"
          alt="logo"
        />
      </div>
      <div>
        <ul class="nav-list-wrapper">
          <router-link to="/ticketSearch">
            <li>首页</li>
          </router-link>
          <a href="https://magestack.cn/" target="_blank">
            <li>文档</li>
          </a>
          <a href="https://magestack.cn/pages/52d5c3/" target="_blank">
            <li>博客</li>
          </a>
          <a href="https://magestack.cn/pages/be7463/" target="_blank">
            <li>社区</li>
          </a>
        </ul>
      </div>
    </div>
  </Header>
</template>

<script setup>
import { Layout } from 'ant-design-vue'
import { useRouter } from 'vue-router'
import { defineProps, toRefs } from 'vue'

const { Header } = Layout
const props = defineProps({
  isLogin: Boolean
})

const { isLogin } = toRefs(props)

const router = useRouter()
</script>

<style lang="scss" scoped>
.logo {
  height: 40px;
  cursor: pointer;
}

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
  }
}
</style>
