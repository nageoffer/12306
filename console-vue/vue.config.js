module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:9000',
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
