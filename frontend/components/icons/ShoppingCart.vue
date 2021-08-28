<template>
  <svg
    :width="width"
    :height="height"
    fill="none"
    viewBox="0 0 514 514"
    xmlns="http://www.w3.org/2000/svg"
  >
    <path
      d="M192.75 471.167C204.578 471.167 214.167 461.578 214.167 449.75C214.167 437.922 204.578 428.333 192.75 428.333C180.922 428.333 171.333 437.922 171.333 449.75C171.333 461.578 180.922 471.167 192.75 471.167Z"
      :style="`stroke:white`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M428.333 471.167C440.161 471.167 449.75 461.578 449.75 449.75C449.75 437.922 440.161 428.333 428.333 428.333C416.505 428.333 406.917 437.922 406.917 449.75C406.917 461.578 416.505 471.167 428.333 471.167Z"
      :style="`stroke:white`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M21.4167 21.4167H107.083L164.48 308.186C166.438 318.046 171.803 326.903 179.633 333.207C187.464 339.511 197.262 342.859 207.313 342.667H415.483C425.534 342.859 435.333 339.511 443.163 333.207C450.994 326.903 456.358 318.046 458.317 308.186L492.583 128.5H128.5"
      :style="`stroke:white`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'ShoppingCart',
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
