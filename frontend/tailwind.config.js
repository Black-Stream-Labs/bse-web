const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  mode: 'jit',
  purge: {
    content: [
      './components/**/*.{vue,js}',
      './layouts/**/*.vue',
      './pages/**/*.vue',
      './plugins/**/*.{js,ts}',
      './nuxt.config.{js,ts}',
    ],
    // options: {
    // safelist: [/col-/, /^dark:/, /bg/, /rows-/],
    // safelist: ['col-start-1', 'col-start-2', 'col-start-3', 'col-start-4'],
    // },
  },
  darkMode: 'class', // 'false' or 'media' or 'class'
  theme: {
    darkSelector: '.dark-mode',
    screens: {
      xs: '475px',
      ...defaultTheme.screens,
    },
    cursor: { 'not-allowed': 'not-allowed', pointer: 'pointer' },
    flexGrow: {
      0: 0,
      DEFAULT: 2,
      1: 1,
    },
    flex: {
      1: '1 1 0%',
      auto: '1 1 auto',
      // initial: '0 1 auto',
      inherit: 'inherit',
      none: 'none',
      2: '2 2 0%',
    },
    minWidth: {
      0: '0',
      '1/4': '25%',
      '1/2': '50%',
      '3/4': '75%',
      full: '100%',
    },
    colors: {
      transparent: 'transparent',
      black: '#000',
      white: '#f9fafb',
      gray: colors.coolGray,
      blue: colors.sky,
      red: colors.rose,
      purple: colors.violet,
      yellow: colors.amber,
      green: colors.green,
      pink: colors.fuchsia,
      tgreen: '#676B3B',
      tpurple: '#673B6B',
      tblue: '#3B4F6C',
      tbrown: '#7F6127',
    },
    extend: {
      cursor: ['hover', 'focus'],
      spacing: {
        128: '32rem',
        144: '36rem',
      },
      borderRadius: {
        '4xl': '2rem',
      },
      transitionProperty: {
        height: 'height',
      },
    },
  },
  variants: {
    scrollbar: ['dark'],
    backgroundColor: [
      'dark',
      'dark-hover',
      'dark-group-hover',
      'dark-even',
      'dark-odd',
      'hover',
      'responsive',
    ],
    borderColor: [
      'dark',
      'dark-focus',
      'dark-focus-within',
      'hover',
      'responsive',
    ],
    height: ['responsive', 'hover', 'focus'],
    textColor: ['dark', 'dark-hover', 'dark-active', 'hover', 'responsive'],
    transitionProperty: ['responsive', 'motion-safe', 'motion-reduce'],
    // transitionTimingFunction: ['hover', 'focus'],
  },
  plugins: [
    require('@tailwindcss/forms')({
      strategy: 'class',
    }),
    require('@tailwindcss/line-clamp'),
    require('tailwindcss-dark-mode'),
    require('tailwind-scrollbar'),
  ],
}
