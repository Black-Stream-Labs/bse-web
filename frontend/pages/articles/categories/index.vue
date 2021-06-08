<template>
  <div>
    <Hero :title="page.title" :subtitle="page.subtitle"></Hero>
    <div class="section">
      <div class="container">
        <BlogCategories></BlogCategories>
        <BlogArticles :articles="articles"></BlogArticles>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import BlogCategories from '@/components/BlogCategories'
import BlogArticles from '@/components/BlogArticles'
export default Vue.extend({
  name: 'ArticlesPage',
  components: {
    BlogCategories,
    BlogArticles,
    Hero,
  },
  layout: 'blog',
  async asyncData({ app }) {
    const data = await app.$strapi.$http.$get('articles')
    const page = await app.$strapi.$http.$get('articles-page')
    return {
      articles: data,
      page,
    }
  },
})
</script>

<style scoped></style>
