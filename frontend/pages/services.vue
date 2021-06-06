<template>
  <main class="main-container">
    <Hero
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="page.header_image.url"
    ></Hero>
    <section class="container max-w-5xl mx-auto">
      <div v-html="$md.render(page.content)" />
    </section>
    <section class="container">magic</section>
  </main>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'

export default Vue.extend({
  name: 'SitePageTemplate',
  components: {
    Hero,
  },
  layout: 'default',
  async asyncData({ app }) {
    const data = await app.$strapi.$http.$get('services')
    return {
      page: data || {},
    }
  },
})
</script>

<style scoped></style>
