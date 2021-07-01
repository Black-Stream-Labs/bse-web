<template>
  <div class="pt-3">
    <p class="py-2">Change Contrast Options:</p>
    <p class="flex items-center justify-center py-3">
      <button
        class="
          mx-3
          px-3
          py-2
          border
          rounded
          border-yellow-400
          dark:bg-gray-500 dark:border-yellow-50
        "
        @click="changeContrast('normal')"
      >
        A
      </button>
      <button
        class="
          mx-3
          px-3
          py-2
          border border-gray-400
          rounded
          bg-gray-900
          text-gray-50
          dark:bg-gray-900 dark:text-yellow-400 dark:border-yellow-400
        "
        @click="changeContrast('sepia')"
      >
        A
      </button>
      <button
        class="
          mx-3
          px-3
          py-2
          border
          rounded
          border-gray-400
          bg-yellow-400
          dark:bg-yellow-400 dark:border-yellow-400 dark:text-gray-900
        "
        @click="changeContrast('yellow')"
      >
        A
      </button>
    </p>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'AccesibilityContrast',
  methods: {
    changeContrast(size: string) {
      const styles = getComputedStyle(
        document.documentElement
      ).getPropertyValue('--contrast-type')
      const currSize = styles.replace('em', '')
      if (Number(currSize) <= 1) return
      document.documentElement.style.setProperty(
        '--contrast-type',
        `${Number(currSize) - Number(size)}em`
      )
    },
  },
})
</script>

<style scoped></style>
