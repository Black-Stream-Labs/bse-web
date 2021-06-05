<template>
  <div class="page-content bg-white dark:bg-gray-900 dark:text-white">
    <a href="#main-content" class="sr-only focus:not-sr-only">
      Skip to content
    </a>
    <AppNavbar></AppNavbar>
    <div id="main-content">
      <div v-if="$fetchState.pending">Super Loader</div>
      <div v-else-if="$fetchState.error">Error</div>
      <template v-else>
        <Nuxt></Nuxt>
      </template>
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

import PageType from '~/types/pageType'

export default Vue.extend({
  name: 'BlogLayout',
  components: {
    AppFooter,
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
