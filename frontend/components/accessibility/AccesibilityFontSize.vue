<template>
  <div class="py-3">
    <p class="px-2 py-3 block">Change Font Size:</p>
    <p class="flex items-center justify-center py-3">
      <button
        class="
          mx-4
          px-3
          py-2
          text-sm
          border
          rounded
          border-gray-400
          dark:bg-gray-900 dark:text-white dark:border-gray-50
        "
        @click="fontSizeDecrease('0.15')"
      >
        A-
      </button>
      <button
        class="
          mx-4
          px-3
          py-2
          text-sm
          border
          rounded
          border-gray-400
          dark:bg-gray-900 dark:text-white dark:border-gray-50
        "
        @click="fontSizeIncrease('0.15')"
      >
        A+
      </button>
    </p>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'AccesibilityFontSize',
  methods: {
    fontSizeIncrease(size: string) {
      let styles = getComputedStyle(document.documentElement).getPropertyValue(
        '--font-size'
      )
      if (!styles) {
        styles = '1rem'
      }
      const currSize = styles.replace('rem', '')
      if (Number(currSize) >= 1.5) return
      document.documentElement.style.setProperty(
        '--font-size',
        `${Number(currSize) + Number(size)}rem`
      )
    },
    fontSizeDecrease(size: string) {
      const styles = getComputedStyle(
        document.documentElement
      ).getPropertyValue('--font-size')
      const currSize = styles.replace('rem', '')
      if (Number(currSize) <= 1) return
      document.documentElement.style.setProperty(
        '--font-size',
        `${Number(currSize) - Number(size)}rem`
      )
    },
  },
})
</script>

<style scoped></style>
