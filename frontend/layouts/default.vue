<template>
  <div class="page-content">
    <AppNavbar></AppNavbar>
    <Nuxt />
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
  name: 'DefaultLayout',
  components: {
    AppFooter,
    AppNavbar,
  },
})
</script>
<style></style>
