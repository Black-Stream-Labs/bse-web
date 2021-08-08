<template>
  <div class="page-content bg-white dark:bg-gray-900 dark:text-white">
    <a href="#main-content" class="sr-only focus:not-sr-only">
      Skip to content
    </a>
    <AppNavbar></AppNavbar>
    <div id="main-content">
      <Nuxt></Nuxt>
    </div>
    <AppFooter />
    <div class="snipcart-summary"></div>
    <div
      id="snipcart"
      hidden
      data-api-key="YzBjZDEzOTctOTU2ZS00MzIxLWFmOWYtZWRlMzY5YjhhMjQ5NjM3NTgzNDUyNjUwMjYzODg5"
    ></div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import AppFooter from '@/components/AppFooter'
import AppNavbar from '@/components/AppNavbar'
const colors = [
  ['#676B3B', '#B1B49A', 'tgreen'], // green
  ['#673B6B', '#B19AB3', 'tpurple'], // purple
  ['#3B4F6C', '#99A3B4', 'tblue'], // blue
  ['#7F6127', '#BEAE7D', 'tbrown'], // brown
]
const bgRandomIndex = Math.floor(Math.random() * colors.length)
const bgc = colors[bgRandomIndex]

export default Vue.extend({
  name: 'DefaultLayout',
  components: {
    AppFooter,
    AppNavbar,
  },

  computed: {
    bgColor() {
      return this.$colorMode.preference === 'dark' ||
        this.$colorMode.preference === 'system'
        ? null
        : bgc
    },
  },
  watch: {
    bgColor(newValue, oldValue) {
      if (newValue !== oldValue) {
        this.$store.dispatch('updateBgColor', newValue)
      }
    },
  },
  created() {},
})
</script>
<style></style>
