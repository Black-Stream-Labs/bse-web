<template>
  <div class="page-content bg-white dark:bg-gray-900 dark:text-white">
    <a href="#main-content" class="sr-only focus:not-sr-only">
      Skip to content
    </a>
    <div id="main-content">
      <div v-if="$fetchState.pending">Super Loader</div>
      <div v-else-if="$fetchState.error">Error</div>
      <template v-else>
        <Hero
          :title="page.title"
          :subtitle="page.content.subtitle"
          :headerimage="page.content.header_image.url"
        ></Hero>
        <section class="section">
          <div class="container">
            <FilterButtons></FilterButtons>
            <Nuxt></Nuxt>
          </div>
        </section>
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
import Hero from '@/components/Hero'
import FilterButtons from '@/components/FilterButtons'
import PageType from '~/types/pageType'

export default Vue.extend({
  name: 'ProductLayout',
  components: {
    AppFooter,
    Hero,
    FilterButtons,
  },
  data() {
    return {
      page: {} as PageType,
    }
  },
  async fetch() {
    this.page = await this.$strapi.$http.$get('product-page')
  },
})
</script>
<style></style>
