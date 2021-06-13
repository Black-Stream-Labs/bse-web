<template>
  <svg
    :width="width"
    :height="height"
    fill="none"
    viewBox="0 0 514 514"
    xmlns="http://www.w3.org/2000/svg"
  >
    <path
      d="M364.083 214.167H64.25"
      :stroke="color"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M449.75 128.5H64.25"
      :stroke="color"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M449.75 299.833H64.25"
      :stroke="color"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M364.083 385.5H64.25"
      :stroke="color"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
  </svg>
</template>

<script lang="ts">
import Vue, { PropOptions } from 'vue'

export default Vue.extend({
  name: 'MenuIcon',
  props: {
    color: {
      type: String,
      default: 'black',
    } as PropOptions,
    width: {
      type: [String, Number],
      default: '30',
    } as PropOptions,
    height: {
      type: [String, Number],
      default: '30',
    } as PropOptions,
  },
})
</script>

<style scoped></style>
