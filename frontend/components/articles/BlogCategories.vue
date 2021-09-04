<template>
  <div class="md:pl-2 flex flex-wrap text-xs capitalize">
    <NuxtLink
      to="/articles/categories"
      class="
        text-gray-500
        font-light
        rounded
        bg-gray-200
        px-2
        py-1
        m-1
        dark:bg-gray-700 dark:text-gray-300
      "
    >
      All Categories
    </NuxtLink>
    <NuxtLink
      v-for="cat in articleCategories"
      :key="cat.slug"
      :to="`/articles/categories/${cat.slug}`"
      class="
        text-gray-500
        font-light
        rounded
        bg-gray-200
        px-2
        py-1
        m-1
        dark:bg-gray-700 dark:text-gray-300
      "
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
