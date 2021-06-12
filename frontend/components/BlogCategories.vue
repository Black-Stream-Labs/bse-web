<template>
  <div class="flex">
    <NuxtLink
      to="/articles"
      class="p-2 mr-2 rounded border border-gray-500 border-opacity-25 hover:border-gray-500 dark:border-opacity-25 dark:border-gray-50 dark:hover:border-gray-50 hover:border-opacity-100 capitalize"
    >
      All Articles
    </NuxtLink>
    <NuxtLink
      v-for="cat in articleCategories"
      :key="cat.slug"
      :to="`/articles/blog-categories/${cat.slug}`"
      class="p-2 mr-2 rounded border border-gray-500 border-opacity-25 hover:border-gray-500 dark:border-gray-50 dark:border-opacity-25 dark:hover:border-gray-50 hover:border-opacity-100 capitalize"
    >
      {{ cat.category }}
    </NuxtLink>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { articleCategories } from '@/apollo/queries/blog/categories.js'
export default Vue.extend({
  name: 'BlogCategories',
  data() {
    return {
      articleCategories: [],
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: articleCategories(),
    })
    this.articleCategories = [...data.articleCategories].flat()
  },
  fetchOnServer: true,
  fetchKey: 'article-categories',
})
</script>

<style scoped></style>
