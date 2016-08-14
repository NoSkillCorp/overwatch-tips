module.exports = {
  entry: [
    './app/index.js', // relative to /client
  ],
  output: {
    path: '../app/assets/react',
    filename: 'react-bundle.js',
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        loaders: ['react-hot', 'babel-loader'],
        exclude: [/node_modules/, /test/]
      }
    ],
  }
}