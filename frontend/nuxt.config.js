import PnpWebpackPlugin from 'pnp-webpack-plugin'
require('dotenv').config()
export default {
  // Global page headers (https://go.nuxtjs.dev/config-head)
  head: {
    title: 'mostre',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
    ],
    link: [
      {
        rel: 'preconnect',
        href: 'https://app.snipcart.com',
      },
      {
        rel: 'preconnect',
        href: 'https://cdn.snipcart.com',
      },
      {
        rel: 'stylesheet',
        href: 'https://cdn.snipcart.com/themes/v3.2.0/default/snipcart.css',
      },
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
    ],
    script: [
      {
        src: 'https://cdn.snipcart.com/themes/v3.2.0/default/snipcart.js',
        async: true,
        crossorigin: 'anonymous',
      },
    ],
  },
  // bodyAttr: {
  //   class: 'has-navbar-fixed-top',
  // },
  // Global CSS (https://go.nuxtjs.dev/config-css)
  css: ['~/assets/css/tailwind.css'],

  // Plugins to run before rendering page (https://go.nuxtjs.dev/config-plugins)
  plugins: [
    '~plugins/axios.js',
    '~/plugins/apollo-overrides.ts',
    // {
    //   src: '~/plugins/calendar.js',
    //   mode: 'client',
    // },
    // {
    //   src: '~/plugins/checkTheme.js',
    //   mode: 'client',
    // },
  ],

  // Auto import components (https://go.nuxtjs.dev/config-components)
  components: false,

  // Modules for dev and build (recommended) (https://go.nuxtjs.dev/config-modules)
  buildModules: [
    // https://go.nuxtjs.dev/typescript
    '@nuxtjs/composition-api/module',
    '@nuxt/typescript-build',
    '@nuxtjs/tailwindcss',
    // '@nuxtjs/ngrok',
    // '@nuxt/image',
    // Doc: https://github.com/nuxt-community/color-mode-module
    '@nuxtjs/color-mode',
    // Doc: https://github.com/nuxt-community/tailwindcss-module
    '@nuxtjs/tailwindcss',
  ],
  colorMode: {
    classSuffix: '',
  },
  tailwindcss: {
    cssPath: '~/assets/css/tailwind.css',
    configPath: 'tailwind.config.js',
    exposeConfig: true,
    config: {},
  },
  ngrok: {
    // module options
    addr: 8080, // port or network address, defaults to 80
    region: 'eu', // one of ngrok regions (us, eu, au, ap, sa, jp, in), defaults to
  },
  // Modules (https://go.nuxtjs.dev/config-modules)
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    // https://go.nuxtjs.dev/pwa
    '@nuxtjs/pwa',
    // https://go.nuxtjs.dev/content
    '@nuxtjs/dotenv',
    '@nuxtjs/pwa',
    '@nuxtjs/auth',
    '@nuxtjs/strapi',
    '@nuxtjs/apollo',
    '@nuxtjs/markdownit',
    '@nuxtjs/proxy',
    '@nuxt/image',
    '@nuxtjs/color-mode',
    // this is for outisde testing only
    // ['@nuxtjs/localtunnel', { subdomain: 'commerce' }],
  ],
  markdownit: {
    preset: 'default',
    linkify: true,
    breaks: true,
    injected: true,
  },
  image: {
    provider: 'static',
    presets: {
      cover: {
        modifiers: {
          fit: 'cover',
          format: 'jpg',
          width: 300,
          height: 300,
        },
      },
      avatar: {
        modifiers: {
          format: 'jpg',
          width: 50,
          height: 50,
        },
      },
    },
  },
  proxy: [
    [
      '/api/v1',
      {
        target: process.env.API_AUTH_URL || 'http://localhost:1337',
        pathRewrite: { '^/api/v1': '/' },
        // changeOrigin: true,
      },
    ],
  ],
  strapi: {
    url: '/api/v1',
    entities: [
      'users',
      'articles',
      'article-categories',
      'article-tags',
      'products',
      'single-events',
      'product-categories',
    ],
  },
  env: {},
  // Axios module configuration (https://go.nuxtjs.dev/config-axios)
  axios: {
    baseUrl: process.env.API_AUTH_URL || 'http://localhost:1337',
    proxy: true,
  },
  apollo: {
    clientConfigs: {
      default: {
        httpEndpoint: process.env.API_AUTH_URL || 'http://localhost:1337',
      },
    },
    defaultOptions: {
      $query: {
        loadingKey: 'loading',
        fetchPolicy: 'cache-and-network',
      },
    },
    authenticationType: 'Bearer',
    tokenName: 'apollo-token',
    includeNodeModules: true,
  },
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: {
            url: 'auth/local',
            method: 'post',
            propertyName: 'jwt',
          },
          user: {
            url: 'users/me',
            method: 'get',
            propertyName: false,
          },
          logout: true,
        },
      },
    },
  },

  // Content module configuration (https://go.nuxtjs.dev/config-content)
  content: {},

  // Build Configuration (https://go.nuxtjs.dev/config-build)
  build: {
    /*
     ** You can extend webpack config here
     */
    babel: {
      presets({ isServer }) {
        return [
          [
            require.resolve('@nuxt/babel-preset-app'),
            // require.resolve('@nuxt/babel-preset-app-edge'), // For nuxt-edge users
            {
              buildTarget: isServer ? 'server' : 'client',
              loose: true,
              corejs: { version: 3 },
            },
          ],
        ]
      },
    },
    corejs: '3',
    // cache: true,
    // extractCSS: true,
    // parallel: true,
    // optimization: {
    //   splitChunks: {
    //     cacheGroups: {
    //       styles: {
    //         name: 'styles',
    //         test: /\.(css|vue)$/,
    //         chunks: 'all',
    //         enforce: true,
    //       },
    //     },
    //   },
    // },
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    transpile: /@fullcalendar.*/,
    extend(config, { isClient }) {
      if (isClient) {
        config.optimization.splitChunks.maxSize = 200000
      }
      config.resolve.plugins.push(PnpWebpackPlugin)
      config.resolveLoader.plugins.push(PnpWebpackPlugin.moduleLoader(module))
    },
  },
}
