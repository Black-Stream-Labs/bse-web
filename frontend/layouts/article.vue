<template>
  <div class="page-content">
    <div v-if="$fetchState.pending">Super Loader</div>
    <div v-else-if="$fetchState.error">Error</div>
    <main v-else class="main-container">
      <Hero
        :title="page.title"
        :subtitle="page.content.subtitle"
        :headerimage="page.content.header_image.url"
      ></Hero>
      <div class="section">
        <div class="container">
          <BlogCategories></BlogCategories>
          <Nuxt></Nuxt>
        </div>
      </div>
    </main>
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
import Hero from '@/components/Hero'
import BlogCategories from '@/components/BlogCategories'
import singleArticle from '@/apollo/queries/blog/article.gql'
import PageType from '~/types/pageType'
export default Vue.extend({
  name: 'BlogLayout',
  components: {
    AppFooter,
    BlogCategories,
    Hero,
  },
  data() {
    return {
      page: {} as PageType,
    }
  },
  async fetch() {
    const { data } = await this.$apolloProvider.defaultClient.query({
      query: singleArticle,
      variables: { slug: this.$route.params.slug },
    })
    this.page = data.articles[0]
  },
})
</script>
<style></style>
