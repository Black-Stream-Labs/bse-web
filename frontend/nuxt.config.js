import PnpWebpackPlugin from 'pnp-webpack-plugin'
require('dotenv').config()
export default {
  head: {
    title: 'Black Stream Education',
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
      {
        src: 'https://polyfill.io/v3/polyfill.min.js?features=es2015',
        // async: true,
        crossorigin: 'anonymous',
      },
    ],
  },
  // bodyAttr: {
  //   class: '',
  // },
  css: ['~/assets/css/tailwind.css'],

  plugins: [
    '~plugins/axios.js',
    '~/plugins/apollo-overrides.ts',
    { src: '~/plugins/validate.js', mode: 'client' },
    { src: '@/plugins/smoothscroll.js', mode: 'client' },
  ],

  // Auto import components (https://go.nuxtjs.dev/config-components)
  components: false,

  // Modules for dev and build (recommended) (https://go.nuxtjs.dev/config-modules)
  buildModules: [
    '@nuxtjs/composition-api/module',
    '@nuxt/typescript-build',
    '@nuxtjs/ngrok',
    '@nuxtjs/color-mode',
    '@nuxtjs/tailwindcss',
    '@braid/vue-formulate/nuxt',
  ],
  colorMode: {
    classSuffix: '',
  },
  tailwindcss: {
    cssPath: '~/assets/css/tailwind.css',
    configPath: 'tailwind.config.js',
    exposeConfig: true,
    // config: {},
  },
  ngrok: {
    // module options
    addr: 8080, // port or network address, defaults to 80
    region: 'eu', // one of ngrok regions (us, eu, au, ap, sa, jp, in), defaults to
  },
  // Modules (https://go.nuxtjs.dev/config-modules)
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/pwa',
    '@nuxtjs/dotenv',
    '@nuxtjs/pwa',
    '@nuxtjs/auth',
    '@nuxtjs/strapi',
    '@nuxtjs/apollo',
    '@nuxtjs/markdownit',
    '@nuxt/image',
    '@nuxtjs/proxy',
  ],
  markdownit: {
    preset: 'default',
    runtime: true,
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
        pathRewrite: { '^/api/v1': '' },
        // changeOrigin: true,
      },
    ],
  ],
  strapi: {
    url: process.env.API_AUTH_URL || 'http://localhost:1337',
    // url: '/api/v1',
    entities: [
      { name: 'users', type: 'collection' },
      { name: 'articles', type: 'collection' },
      { name: 'article-categories', type: 'collection' },
      { name: 'article-tags', type: 'collection' },
      { name: 'products', type: 'collection' },
      { name: 'single-events', type: 'collection' },
      { name: 'product-categories', type: 'collection' },
      { name: 'messages', type: 'collection' },
      { name: 'social-media-accounts', type: 'collection' },
      { name: 'domainExperts', type: 'collection' },
    ],
  },
  env: {},
  axios: {
    // baseUrl: process.env.API_AUTH_URL || 'http://localhost:1337',
    // prefix: '/api/v1',
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
    transpile: ['vee-validate/dist/rules'],
    babel: {
      presets({ isServer }) {
        return [
          [
            require.resolve('@nuxt/babel-preset-app'),
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
    extend(config, { isClient }) {
      if (isClient) {
        config.optimization.splitChunks.maxSize = 200000
      }
      config.resolve.plugins.push(PnpWebpackPlugin)
      config.resolveLoader.plugins.push(PnpWebpackPlugin.moduleLoader(module))
    },
  },
}
