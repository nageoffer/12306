module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://kz2jnh.natappfree.cc',
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
