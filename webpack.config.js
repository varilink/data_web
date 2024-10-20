// -----------------------------------------------------------------------------
// webpack.config.js
// -----------------------------------------------------------------------------

/*
The is the webpack configuration file for building the client Javascript and CSS
bundles used by the front-end of the DATA website. These are organised into two
modules, main and tinymce. The main module is used throughout the website
whereas the tinymce module is only used on the single page within the site's
admin interface that uses the TinyMCE editor.
*/

const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {

  entry: {
    main: path.resolve(__dirname, 'src/js/main.js'),
    tinymce: path.resolve(__dirname, 'src/js/tinymce.js'),
  },

  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'dist/js'),
  },

  module: {
    rules: [
      {
        test: /\.css$/i,
        exclude: [
          /content\.inline\.css$/,
          /skin.css$/,
        ],
        use: [MiniCssExtractPlugin.loader, 'css-loader'],
      },
      {
        test: /content\.inline\.css$/,
        type: 'asset/resource',
        generator: {
          filename: '../css/[base]'
        },
      },
      {
        test: /skin\.css$/,
        type: 'asset/resource',
        generator: {
          filename: '../css/[base]'
        },
      },
      {
        test: /\.s[ac]ss$/i,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
      },
      {
        test: /\.jpg$/i,
        type: 'asset/resource',
        generator: {
          filename: '../img/[base]'
        },
      },
      {
        test: /\.png$/i,
        type: 'asset/resource',
        generator: {
          filename: '../img/jquery-ui/[base]'
        },
      },
      {
        test: /\.(ttf|woff2)$/i,
        type: 'asset/resource',
        generator: {
          filename: '../webfonts/[base]'
        },
      },
    ],
  },

  plugins: [
    new CopyPlugin({
      patterns: [
        { from: 'media/website/', to: '../img/' },
        { from: 'src/img/', to: '../img/' },
        { from: 'src/docs/', to: '../docs/' },
      ],
    }),
    new MiniCssExtractPlugin({
      filename: '../css/[name].css',
    }),
  ],

  resolve: {
    modules: [
      './',
      path.resolve(__dirname, 'node_modules/jquery-ui/themes/base'),
      path.resolve(__dirname, 'node_modules'),
    ]
  }

}

/*
  // Javascript bundle for the main module
  {
    entry: './src/js/main.js',
    output: {
      filename: 'main.min.js',
      path: path.resolve(__dirname, 'dist/js'),
    },
  },

  // Javascript bundle for the TinyMCE module
  {
    entry: './src/js/tinymce.js',
    output: {
      filename: 'tinymce.min.js',
      path: path.resolve(__dirname, 'dist/js'),
    },
    module: {
      rules: [
        {
          test: /\.css$/,
          use: [MiniCssExtractPlugin.loader, 'css-loader'],
          type: 'css',
          generator: {
            filename: '[hash][ext][query]',
          },
        },
      ],
    }
  },

  // CSS bundle for the main module
  {
    entry: './src/scss/main.scss',
    plugins: [
      new CopyPlugin({
        patterns: [
          { from: 'media/website', to: '../img' },
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
  },

  // CSS bundle for the TinyMCE module
  {
    entry: './src/css/tinymce.css',
    plugins: [
      new MiniCssExtractPlugin(),
    //  new RemoveEmptyScriptsPlugin()
    ],
    output: {
      filename: 'tinymce.css',
      path: path.resolve(__dirname, 'dist/css'),
    },
    resolve: {
      modules: [
        path.resolve(__dirname, 'node_modules'),
      ],
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
  },
*/
