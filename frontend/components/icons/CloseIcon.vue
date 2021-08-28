<template>
  <svg
    :width="width"
    :height="height"
    fill="none"
    viewBox="0 0 514 514"
    xmlns="http://www.w3.org/2000/svg"
  >
    <path
      d="M384 128L128 384"
      :style="`stroke: ${color}`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M128 128L384 384"
      :style="`stroke: ${color}`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <!-- <path
      d="M384 128L128 384"
      :style="`stroke: ${
        $colorMode.preference === 'light' ? 'indigo' : 'white'
      }`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M128 128L384 384"
      :style="`stroke: ${
        $colorMode.preference === 'light' ? 'indigo' : 'white'
      }`"
      stroke-width="30"
      stroke-linecap="round"
      stroke-linejoin="round"
    /> -->
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'CloseIcon',
  props: {
    width: {
      type: [String, Number],
      default: '30',
    },
    color: {
      type: String,
      default: 'white',
    },
    height: {
      type: [String, Number],
      default: '30',
    },
  },
})
</script>

<style scoped></style>
