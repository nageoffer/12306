<template>
  <Header :class="{ isLogin }">
    <div class="header-wrapper">
      <div>
        <img
          @click="router.push('/login')"
          class="logo"
          src="../../assets/logo.png"
          alt="logo"
        />
      </div>
      <div>
        <ul class="nav-list-wrapper">
          <router-link to="/about">
            <li>首页</li>
          </router-link>
          <router-link to="/about">
            <li>文档</li>
          </router-link>
          <router-link to="/about">
            <li>博客</li>
          </router-link>
          <router-link to="/about">
            <li>社区</li>
          </router-link>
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
