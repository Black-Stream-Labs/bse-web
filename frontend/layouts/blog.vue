<template>
  <div class="page-content">
    <AppNavbar></AppNavbar>
    <div v-if="$fetchState.pending">Super Loader</div>
    <div v-else-if="$fetchState.error">Error</div>
    <main v-else class="main-container">
      <Nuxt></Nuxt>
    </main>
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
// import Hero from '@/components/Hero'
import AppFooter from '@/components/AppFooter'
import AppNavbar from '@/components/AppNavbar'

// import BlogCategories from '@/components/BlogCategories'
import PageType from '~/types/pageType'

export default Vue.extend({
  name: 'BlogLayout',
  components: {
    AppFooter,
    // Hero,
    // BlogCategories,
    AppNavbar,
  },
  data() {
    return {
      page: {} as PageType,
    }
  },
  async fetch() {
    this.page = await this.$strapi.$http.$get('articles-page')
  },
})
</script>
<style></style>
