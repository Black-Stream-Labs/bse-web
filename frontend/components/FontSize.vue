<template>
  <div>
    <span class="px-2">Change Font Size:</span>
    <button @click="fontSizeIncrease('0.25')">A+</button>
    <button @click="fontSizeDecrease('0.25')">A-</button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'FontSize',
  methods: {
    fontSizeIncrease(size) {
      let styles = getComputedStyle(document.documentElement).getPropertyValue(
        '--font-size'
      )
      console.log(styles, Number(size))
      if (!styles) {
        styles = '1em'
      }
      const currSize = styles.replace('em', '')
      if (Number(currSize) >= 3) return
      document.documentElement.style.setProperty(
        '--font-size',
        `${Number(currSize) + Number(size)}em`
      )
    },
    fontSizeDecrease(size) {
      const styles = getComputedStyle(
        document.documentElement
      ).getPropertyValue('--font-size')
      const currSize = styles.replace('em', '')
      if (Number(currSize) <= 1) return
      document.documentElement.style.setProperty(
        '--font-size',
        `${Number(currSize) - Number(size)}em`
      )
    },
  },
})
</script>

<style scoped></style>
