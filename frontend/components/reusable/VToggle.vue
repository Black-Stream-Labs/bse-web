<template>
  <div class="flex items-center justify-center w-full pt-3">
    <label for="toggleB" class="flex items-center cursor-pointer">
      <!-- toggle -->
      <div class="relative">
        <!-- input -->
        <input
          id="toggleB"
          v-model="darkMode"
          type="checkbox"
          class="sr-only"
        />
        <!-- line -->
        <div class="block bg-gray-600 w-14 h-8 rounded-full"></div>
        <!-- dot -->
        <div
          class="
            dot
            absolute
            left-1
            top-1
            bg-white
            w-6
            h-6
            rounded-full
            transition
          "
        ></div>
      </div>
      <!-- label -->
      <div class="ml-3 text-gray-700 font-medium">Dark Mode?</div>
    </label>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'VToggle',
  data() {
    return {
      darkMode: false,
    }
  },
  watch: {
    darkMode(newValue, _oldValue) {
      if (newValue) {
        // Whenever the user explicitly chooses dark mode
        localStorage.theme = 'dark'
      } else {
        // Whenever the user explicitly chooses light mode
        localStorage.theme = 'light'
      }
    },
  },
})
</script>

<style scoped>
/* Toggle B */
input:checked ~ .dot {
  transform: translateX(100%);
  background-color: #48bb78;
}
</style>
