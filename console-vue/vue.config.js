module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://jwm7mq.natappfree.cc',
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
