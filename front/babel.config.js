module.exports = {
  presets: [
    ['@babel/env', {
      targets: {
        browsers: ['last 3 versions', '> 2%', 'ie >= 10', 'Firefox >= 30', 'Chrome >= 30']
      },
      modules: false,
      loose: true,
      useBuiltIns: 'entry'
    }]
  ],
  plugins: [
    '@babel/plugin-transform-runtime',
    '@babel/plugin-syntax-dynamic-import'
  ],
  env: {
    test: {
      plugins: ['transform-es2015-modules-commonjs']
    }
  }
}
