<template>
  <div class="pt-3 pb-6">
    <label for="fontFamily" class="px-2">Chose Font Family</label>
    <div class="flex items-center justify-center py-3">
      <select
        id="fontFamily"
        v-model="fontFamily"
        class="
          w-28
          h-8
          border
          rounded
          dark:bg-gray-900 dark:text-white dark:border-gray-50
        "
      >
        <option value="Alegreya">Alegreya</option>
        <option value="Helvetica">Helvetica</option>
        <option value="OpenDyslexic">OpenDyslexic</option>
        <option value="system">System</option>
      </select>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'AccesibilityFonts',
  data() {
    return {
      fontFamily: 'Alegreya',
    }
  },
  watch: {
    fontFamily(newValue, oldValue) {
      if (newValue === oldValue) return

      switch (newValue) {
        case 'Alegreya':
          document.documentElement.style.setProperty(
            '--font-family',
            `Alegreya`
          )
          break
        case 'Helvetica':
          document.documentElement.style.setProperty(
            '--font-family',
            `Helvetica`
          )
          break
        case 'OpenDyslexic':
          document.documentElement.style.setProperty(
            '--font-family',
            `OpenDyslexic`
          )
          break
        case 'system':
          document.documentElement.style.setProperty(
            '--font-family',
            `system-ui, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji','Segoe UI Emoji'`
          )
          break

        default:
          document.documentElement.style.setProperty(
            '--font-family',
            `Alegreya`
          )
          break
      }
    },
  },
})
</script>

<style scoped></style>
