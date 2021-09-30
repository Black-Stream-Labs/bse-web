<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    version="1.2"
    viewBox="0 0 303 125"
    :width="width"
    :height="height"
  >
    <path
      fill="none"
      :stroke="color"
      stroke-width="2"
      d="m192.5.79-2.63 9.76 7.12 10.68 86.25 16.22V33.1L192.5.79Zm-4.93 14.7 6.92 10.09 44.7 35.8h-42.13l-21.76-3.36 12.27-42.53Zm27.82 22.95 28.09 22.94h46.68V51.1l-4.75-9.69-70.02-2.97Zm71.99-3.86 14.44 5.74-1.78 8.11-12.66-13.85Zm0 4.55 11.87 11.67-2.38 6.93-2.27-8.11-7.22-10.49Zm5.09 13.55v8.7l2.39-2.27-2.39-6.43Z"
    />
    <path :fill="color" d="m198.77 23.9 84.47 15.73-69.63-3.47-14.84-12.26Z" />
    <path
      fill="none"
      :stroke="color"
      stroke-width="2"
      d="M183.02.79h6.39l-6.76 20.84.37-20.84Z"
    />
    <path
      :fill="color"
      d="m178.8 6-47.28 39.56 32.24 66.26 19.26 12.47V62.08L171.38 60l9.49-33.23L178.8 6Zm5.73 56.37h1.68l4.85 51.83-6.53-2.38V62.37Zm0 51.83 32.44 10.09h-32.44V114.2Zm8.31-10.09 1.19 10.09 28.28.79-29.47-10.88Z"
    />
    <path
      :fill="color"
      d="M60.91.26h120.13l-54.33 44.9 15.69 30-81.49 1.59V.26Zm-1.98 0-17.8 20.18 1.78 5.93L25.89 50.9l18.99 56.18 14.05 9.89V.26Z"
    />
    <path
      :fill="color"
      d="m38.16 19.85 1.98 6.52L.18 81.96l5.54-36.6 32.44-25.51ZM60.91 78.4v27.69l8.9 3.46-.97-31.15h-7.93Zm0 30.26 8.9 3.16 24.52 6.53H60.91v-9.69Zm10.68-8.11v9l28.09 1.88-28.09-10.88Z"
    />
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'BadgerIcon',
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
