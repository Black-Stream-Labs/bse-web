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

export default Vue.extend({
  name: 'DefaultLayout',
  components: {
    AppFooter,
    AppNavbar,
  },
  mounted() {
    this.$root.$on('changeColor', (data: string) => {
      console.log('color changed', data)
    })
  },
})
</script>
<style></style>
