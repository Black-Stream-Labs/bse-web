<template>
  <div>
    <Hero
      v-if="page"
      title="Latest News"
      :subtitle="page.subtitle"
      :headerimage="updatedHeaderIMage"
    ></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div v-html="$md.render(updatedContent)"></div>
        </div>
        <BlogArticles :articles="articles"></BlogArticles>
        <NuxtChild></NuxtChild>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import BlogArticles from '@/components/BlogArticles'
import { articleExtracts } from '@/apollo/queries/blog/articles.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'ArticlesPage',
  components: {
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
      if (this.page.content) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return null
      }
    },
    updatedHeaderIMage() {
      if (this.page.content && this.page.content.header_image) {
        return this.page.content.header_image.url
      } else {
        return null
      }
    },
  },
  mounted() {
    this.$root.$on('search-articles', async (data) => {
      const artc = await this.$strapi.find('articles', {
        title_contains: data,
      })
      this.articles = artc
    })
  },
})
</script>

<style scoped></style>
