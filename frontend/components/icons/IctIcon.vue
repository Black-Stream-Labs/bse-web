<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    fill="none"
    viewBox="0 0 441 301"
    :width="width"
    :height="height"
  >
    <path
      :stroke="color"
      stroke-linecap="round"
      stroke-linejoin="round"
      stroke-width="10"
      d="M322.22 288.5H117.78a3.36 3.36 0 0 1 0-6.71h204.44a3.36 3.36 0 0 1 0 6.72Zm-48.92-61.59a71.5 71.5 0 0 1-4.05 5.7l-.1.13a69.15 69.15 0 0 0-5.04 7.3c-1.5 2.62-2.83 5.8-2.83 9.31 0 3.54 1.33 6.72 2.83 9.35a68.13 68.13 0 0 0 5.05 7.27l.1.13a69.4 69.4 0 0 1 4.06 5.7H166.68a69.73 69.73 0 0 1 4.06-5.7l.1-.13a68.13 68.13 0 0 0 5.05-7.27c1.5-2.63 2.83-5.8 2.83-9.35 0-3.53-1.33-6.7-2.83-9.33a68.84 68.84 0 0 0-5.05-7.28l-.1-.13a70.6 70.6 0 0 1-4.05-5.7H273.3Zm129.65-10H37.05c-6.66 0-12.05-5.4-12.05-12.05V25.06C25 18.38 30.4 13 37.05 13h365.9c6.62 0 12.05 5.4 12.05 12.05v179.81c0 6.65-5.43 12.05-12.05 12.05Z"
    />
    <path
      :stroke="color"
      stroke-width="10"
      d="M308.62 127.1H207.8V68.37h100.82v58.75Z"
    />
    :
    <path fill="color" d="M237.2 166.5H126.38V97.76H237.2v68.74Z" />
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'IctIcon',
  props: {
    color: {
      type: String,
      default: 'white',
    },
    width: {
      type: [String, Number],
      default: '30',
    },
    height: {
      type: [String, Number],
      default: '30',
    },
  },
})
</script>

<style scoped></style>
