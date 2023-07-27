module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://7zw8r9.natappfree.cc',
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
