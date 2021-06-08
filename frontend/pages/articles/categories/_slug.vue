<template>
  <BlogArticles :articles="articles" />
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import blogCategory from '~/apollo/queries/blog/category'
export default Vue.extend({
  name: 'CategoryPage',
  layout: 'blog',

  async asyncData({ app, route }) {
    try {
      const { data } = await app.apolloProvider.defaultClient.query({
        query: blogCategory,
        variables: {
          slug: route.params.slug.toLowerCase(),
        },
      })
      return {
        articles: data.blogCategories[0].articles,
      }
    } catch (error) {
      return error
    }
  },
  data() {
    return {
      // error: null,
      // articles: [],
    }
  },
})
</script>
