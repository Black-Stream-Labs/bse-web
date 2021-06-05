<template>
  <div class="pt-3 pb-6">
    <label for="fontFamily" class="px-2">Chose Font Family</label>
    <select
      id="fontFamily"
      v-model="fontFamily"
      class="w-28 h-8 border rounded dark:bg-gray-900 dark:text-white dark:border-gray-50"
    >
      <option value="Default">Default</option>
      <option value="Arial">Arial</option>
      <option value="Helvetica">Helvetica</option>
      <option value="system">System</option>
    </select>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'AccesibilityFonts',
  data() {
    return {
      fontFamily: 'Default',
    }
  },
  watch: {
    fontFamily(newValue, oldValue) {
      if (newValue === oldValue) return

      switch (newValue) {
        case 'Default':
          document.documentElement.style.setProperty('--font-family', `Default`)
          break
        case 'Arial':
          document.documentElement.style.setProperty('--font-family', `Arial`)
          break
        case 'Helvetica':
          document.documentElement.style.setProperty(
            '--font-family',
            `Helvetica`
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
            `system-ui, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji','Segoe UI Emoji'`
          )
          break
      }
    },
  },
})
</script>

<style scoped></style>
