module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://12306-rd.magestack.cn:9000',
        changeOrigin: true,
        ws: true
      }
    }
  },
  css: {
    loaderOptions: {
      less: {
        javascriptEnabled: true,
        modifyVars: {
          'border-radius-base': '4px',
          'card-radius': '4px'
        }
      }
    }
  }
}
