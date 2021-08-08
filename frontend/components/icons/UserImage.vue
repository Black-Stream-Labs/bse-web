<template>
  <svg
    :width="width"
    :height="height"
    fill="none"
    viewBox="0 0 514 514"
    focusable="false"
    xmlns="http://www.w3.org/2000/svg"
  >
    <path
      d="M513 512.995V456.106C513 425.93 499.514 396.99 475.51 375.653C451.505 354.315 418.948 342.328 385 342.328H129C95.0523 342.328 62.495 354.315 38.4903 375.653C14.4857 396.99 1 425.93 1 456.106V512.995"
      :style="`stroke: white`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M257 228.556C327.692 228.556 385 177.616 385 114.778C385 51.94 327.692 1 257 1C186.308 1 129 51.94 129 114.778C129 177.616 186.308 228.556 257 228.556Z"
      :style="`stroke: white`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'UserImage',
  props: {
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
