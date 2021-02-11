const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

const sassLoader = environment.loaders.get('sass')
sassLoader.use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})
sassLoader.use.push('import-glob-loader')
environment.loaders.prepend('erb', erb)

const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'],
    moment: 'moment'
  })
)
const MomentLocalesPlugin = require('moment-locales-webpack-plugin')
environment.plugins.append(
  'MomentLocalesPlugin',
  new MomentLocalesPlugin({
    localesToKeep: ['en', 'ja']
  })
)

environment.splitChunks()
module.exports = environment
