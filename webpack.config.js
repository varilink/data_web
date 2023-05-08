const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts');

module.exports = [

  // Main Javascript module, used throughout the site
  {
    entry: './src/js/main.js',
    output: {
      filename: 'main.js',
      path: path.resolve(__dirname, 'dist/js'),
    },
    mode: 'production',
  },

  // TinyMCE Javascript module, used only in the site's admin interface
  {
    entry: './src/js/tinymce.js',
    output: {
      filename: 'tinymce.js',
      path: path.resolve(__dirname, 'dist/js'),
    },
    mode: 'production',
  },

  // Main CSS module
  {
    entry: './src/scss/main.scss',
    plugins: [
      new CopyPlugin({
        patterns: [
          { from: 'gimp/dest', to: '../img' },
          { from: 'src/img/', to: '../img' },
          { from: 'src/docs/', to: '../docs' },
        ],
      }),
      new MiniCssExtractPlugin(),
      new RemoveEmptyScriptsPlugin()
    ],
    output: {
      filename: 'main.js',
      path: path.resolve(__dirname, 'dist/css'),
    },
    resolve: {
      modules: [
        path.resolve(__dirname, 'node_modules/jquery-ui/themes/base'),
        'node_modules',
      ],
    },
    module: {
      rules: [
        {
          test: /\.(sa|sc|c)ss$/,
          use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
        },
        {
          test: /\.(jpg|png|svg)$/,
          type: 'asset/resource',
          generator: {
            filename: 'img/[hash][ext][query]',
          },
        },
        {
          test: /\.(eot|ttf|woff|woff2)$/,
          type: 'asset/resource',
          generator: {
            filename: 'fonts/[hash][ext][query]',
          },
        },
      ],
    },
    mode: 'production',
  },

  // TinyMCE CSS module, used only in the site's admin interface
  {
    entry: './src/css/tinymce.css',
    plugins: [new MiniCssExtractPlugin(), new RemoveEmptyScriptsPlugin()],
    output: {
      filename: 'tinymce.js',
      path: path.resolve(__dirname, 'dist/css'),
    },
    resolve: {
      modules: ['node_modules'],
    },
    module: {
      rules: [
        {
          test: /\.css$/,
          use: [MiniCssExtractPlugin.loader, 'css-loader'],
        },
        {
          test: /\.gif$/,
          type: 'asset/resource',
          generator: {
            filename: 'img/[hash][ext][query]',
          },
        },
        {
          test: /\.(eot|svg|ttf|woff)$/,
          type: 'asset/resource',
          generator: {
            filename: 'fonts/[hash][ext][query]',
          },
        },
      ],
    },
    mode: 'production',
  },

]
