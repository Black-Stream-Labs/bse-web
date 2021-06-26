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
    <div
      id="snipcart"
      hidden
      data-api-key="ZTc4ZDcwYzktMjNlYy00NjAxLTllMzgtOTk4ZWM1NTlhYjI3NjM1OTIxNTA0MDk0ODc5MDQ4"
    ></div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import AppFooter from '@/components/AppFooter'
import AppNavbar from '@/components/AppNavbar'

export default Vue.extend({
  name: 'Product',
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
