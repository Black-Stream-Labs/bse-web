<template>
  <div>
    <Hero title="Latest News" :subtitle="page.subtitle"></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div v-html="$md.render(updatedContent)"></div>
        </div>
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
import { articleExtracts } from '@/apollo/queries/blog/articles.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'ArticlesPage',
  components: {
    BlogCategories,
    BlogArticles,
    Hero,
  },
  layout: 'blog',
  async asyncData({ app }) {
    const page = await app.$strapi.$http.$get('articles-page')
    const articles = await app.$strapi.graphql({ query: articleExtracts() })
    return {
      page,
      articles: articles.articles,
    }
  },
  computed: {
    updatedContent() {
      return formatContentImageUrl(this.page.content.content)
    },
  },
})
</script>

<style scoped></style>
