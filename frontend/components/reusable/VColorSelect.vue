<template>
  <div class="pt-3">
    <label for="themeSelect" class="px-2">Chose Theme Mode</label>
    <div class="flex items-center justify-center py-3">
      <select
        id="themeSelect"
        v-model="$colorMode.preference"
        class="
          w-28
          h-8
          border
          rounded
          dark:bg-gray-900 dark:text-white dark:border-gray-50
        "
        :style="
          $store.state.fullColor
            ? `background:${$store.state.fullColor.color}`
            : ''
        "
      >
        <option value="system">System</option>
        <option value="light">Light</option>
        <option value="dark">Dark</option>
      </select>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'VColorSelect',
})
</script>

<style lang="postcss" scoped></style>
