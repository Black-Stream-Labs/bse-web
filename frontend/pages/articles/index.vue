<template>
  <BlogArticles :articles="articles" :error="error"></BlogArticles>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import articlesQuery from '~/apollo/queries/blog/articles'
export default Vue.extend({
  name: 'ArticlesPage',
  layout: 'blog',
  async asyncData({ app }) {
    try {
      const { data } = await app.apolloProvider.defaultClient.query({
        query: articlesQuery,
      })
      const page = await app.$strapi.$http.$get('product-page')
      return { articles: data.articles, page }
    } catch (err) {
      const { data } = err
      return { error: data.err }
    }
  },
  data() {
    return {
      error: null,
      page: {},
      articles: [],
    }
  },
})
</script>

<style scoped></style>
