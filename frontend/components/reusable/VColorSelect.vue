<template>
  <div class="py-2">
    <label for="themeSelect" class="px-2">Chose Theme Mode</label>
    <select
      id="themeSelect"
      v-model="$colorMode.preference"
      class="w-28 h-8 border rounded dark:bg-gray-900 dark:text-white dark:border-gray-50"
      @change="$root.$emit('changeColor')"
    >
      <option value="system">System</option>
      <option value="light">Light</option>
      <option value="dark">Dark</option>
    </select>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'VColorSelect',
  beforeDestroy() {
    this.$root.$off()
  },
})
</script>

<style lang="postcss" scoped></style>
