<template>
  <main class="main-container">
    <Hero
      :title="page.title"
      :subtitle="page.content.subtitle"
      :headerimage="page.content.header_image.url"
    ></Hero>
    <div class="section">
      <div class="content" v-html="$md.render(page.content.content)" />
      <div class="container"></div>
    </div>
  </main>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'

export default Vue.extend({
  name: 'SitePageTemplate',
  layout: 'default',
  async asyncData({ app, route }) {
    const routeName = route.name === 'index' ? 'home-page' : route.params.slug
    const data = await app.$strapi.$http.$get(routeName)
    return {
      page: data,
    }
  },
})
</script>

<style scoped></style>
