<template>
  <div class="page-content">
    <Nuxt />
    <AppFooter />
    <!-- <div
      id="snipcart"
      hidden
      data-api-key="ZTc4ZDcwYzktMjNlYy00NjAxLTllMzgtOTk4ZWM1NTlhYjI3NjM1OTIxNTA0MDk0ODc5MDQ4"
    ></div> -->
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import AppFooter from '@/components/AppFooter'

export default Vue.extend({
  name: 'DefaultLayout',
  components: {
    AppFooter,
  },
})
</script>
<style></style>
