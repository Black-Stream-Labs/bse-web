<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    version="1.2"
    viewBox="0 0 278 180"
    :height="height"
    :width="width"
  >
    <g :fill="color">
      <path
        d="m171.24 20.8 45.36-10.55-24 120.27-49.58-57.5 28.22-52.22Zm47.47-10.55 58.73 29.8-63.4-6.55 4.67-23.25Z"
      />
      <path
        d="m171.9 18.96 46.02-11 59.52 31.11L217.92.89 171.9 18.96Zm-30.17 55.73 49.42 57.67L.56 142.65l141.17-67.96Zm-26.77 63.57 76.19-4.12-70.95 27.96-5.24-23.84Zm5.82 25.34 21.91-8.5 46.25 24.21-68.16-15.71Z"
      />
    </g>
  </svg>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'RavenIcon',
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
