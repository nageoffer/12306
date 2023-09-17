<template>
  <Space direction="vertical" style="width: 100%">
    <div class="info-container">
      <div class="icon">
        <IconFont type="icon-wancheng" style="font-size: 50px"></IconFont>
      </div>
      <div class="info">
        <div class="top">
          <span class="success-text">交易已完成</span>
          <span class="thank-text">感谢你选择铁路出行！您的订单号是：</span>
          <span class="order-text">E99909093</span>
        </div>
        <div>
          <span class="tip-text"
            >machen
            先生/女士可持购票时所使用的中国居民身份证原件于购票后、列车开车前到车站直接检票乘车</span
          >
        </div>
      </div>
    </div>
    <div class="custom">
      <Card title="订单信息">
        <div class="ticket-info">
          <span class="main-text">2023-02-01（周四）C2647</span>
          <span class="small-text">次</span>
          <span class="main-text">北京南</span>
          <span class="small-text">站</span>
          <span class="main-text">（21:22开）-天津西</span>
          <span class="small-text">站（21:57到）</span>
        </div>
        <Table :columns="column" size="small"></Table>
        <Divider></Divider>
        <Space>
          <Button>餐饮·特产</Button>
          <Button>继续购票</Button>
          <Button>查询订单详情</Button>
        </Space>
      </Card>
    </div>
  </Space>
</template>

<script setup scoped>
import { Card, Space, Table, Divider, Button } from 'ant-design-vue'
import IconFont from '@/components/icon-font'

const column = [
  {
    title: '序号',
    dataIndex: 'id'
  },
  {
    title: '姓名',
    dataIndex: 'name'
  },
  {
    title: '证件类型',
    dataIndex: 'type'
  },
  {
    title: '证件号码',
    dataIndex: 'idCard'
  },
  {
    title: '票种',
    dataIndex: 'ticketType'
  },
  {
    title: '席别',
    dataIndex: 'seat'
  },
  {
    title: '车厢',
    dataIndex: 'carriage'
  },
  {
    title: '席位号',
    dataIndex: 'seatNumber'
  },
  {
    title: '票价（元）',
    dataIndex: 'prise'
  },
  {
    title: '订单状态',
    dataIndex: 'status'
  }
]
</script>

<style lang="scss" scoped>
.info-container {
  width: 100%;
  border: 1px solid #4a8dc9;
  padding: 20px 40px;
  background-color: #f0fed1;
  display: flex;
  align-items: center;
  .icon {
    margin-right: 30px;
  }
  .info {
    .top {
      margin-bottom: 6px;
      .success-text {
        color: #9ecf6a;
        font-size: 16px;
        font-weight: bolder;
        margin-right: 6px;
      }
      .thank-text {
        font-size: 14px;
        color: black;
      }
      .order-text {
        font-size: 16px;
        color: #eb8940;
        font-weight: bolder;
      }
    }

    .tip-text {
      color: rgba($color: black, $alpha: 0.6);
    }
  }
}
.ticket-info {
  margin-bottom: 6px;
  .main-text {
    font-size: 16px;
    font-weight: bolder;
  }
  .small-text {
    font-size: 14px;
  }
}
::v-deep {
  .ant-table-thead {
    .ant-table-cell {
      background: #f3f3f3 !important;
      background-color: #f3f3f3 !important;
    }
  }
}
</style>
