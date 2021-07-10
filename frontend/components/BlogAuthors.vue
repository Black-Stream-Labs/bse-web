<template>
  <div class="md:pl-2 flex flex-wrap text-xs capitalize">
    <NuxtLink
      to="/articles/authors"
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
      All Authors
    </NuxtLink>
    <NuxtLink
      v-for="author in authors"
      :key="author.username"
      :to="`/articles/authors/${author.username}`"
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
      {{ author.username }}
    </NuxtLink>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { authors } from '@/apollo/queries/blog/authors.js'
export default Vue.extend({
  name: 'BlogAuthors',
  data() {
    return {
      authors: [],
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: authors(),
    })
    this.authors = [...data.users].flat()
  },
  fetchOnServer: true,
  fetchKey: 'article-authors',
})
</script>

<style scoped></style>
