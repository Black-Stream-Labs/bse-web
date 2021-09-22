<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    fill="none"
    viewBox="0 0 512 512"
    :width="width"
    :height="height"
  >
    <path
      :stroke="color"
      stroke-linecap="round"
      stroke-linejoin="round"
      stroke-width="20"
      d="M384 170.667c35.346 0 64-28.654 64-64 0-35.347-28.654-64-64-64-35.346 0-64 28.653-64 64 0 35.346 28.654 64 64 64ZM128 320c35.346 0 64-28.654 64-64 0-35.346-28.654-64-64-64-35.346 0-64 28.654-64 64 0 35.346 28.654 64 64 64ZM384 469.333c35.346 0 64-28.654 64-64 0-35.346-28.654-64-64-64-35.346 0-64 28.654-64 64 0 35.346 28.654 64 64 64ZM183.254 288.214l145.707 84.906M328.747 138.88l-145.493 84.907"
    />
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'ShareIcon',
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
