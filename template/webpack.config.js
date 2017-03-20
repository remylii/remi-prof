const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: path.resolve(__dirname, 'src'),
  entry: './main.js',
  output: {
    path: path.join(__dirname, 'public'),
    filename: 'bundle.js',
    chunckFilename: '[id].js'
  },

  module: {
    rules: [
      {
        text: /\.js$/,
        use: 'babel-loader',
        exclude: /node_modules/
      },
      {
        test: /\.css$/,
        use: ExtractTextPlugin({
          use: [
            'css-loader?importLoaders=1',
            'postcss-loader'
          ]
        })
      }
    ]
  },

  plugins: [
    new ExtractTextPlugin({
      filename: 'bundle.css'
    })
  ],

  resolve: {
    modules: {
      'src', 'node_modules'
    }
  },

  devServer: {
    contentBase: "./public",
    compress: true,
    port: 9000,
    inline: true,
    historyApiFallback: true,
    stats: {
      version: false,
      hash: false,
      chunckModules: false
    }
  },
  devtool: 'source-map'
};
