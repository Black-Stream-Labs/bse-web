<template>
  <div class="columns is-mobile is-multiline is-centered">
    <div class="column is-12">
      <NuxtLink
        to="/articles"
        class="py-2 px-4 mr-2 button is-active is-outlined is-small is-rounded"
      >
        All Blogs
      </NuxtLink>
      <NuxtLink
        v-for="cat in articleCategories"
        :key="cat.slug"
        :to="`/articles/blog-categories/${cat.slug}`"
        class="py-2 px-4 mr-2 button is-small is-rounded"
      >
        {{ cat.category }}
      </NuxtLink>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import categoriesQuery from '~/apollo/queries/blog/categories'
export default Vue.extend({
  name: 'FilterButtons',
  data() {
    return {
      articleCategories: [],
      error: null,
    }
  },
  apollo: {
    articleCategories: {
      prefetch: true,
      query: categoriesQuery,
    },
  },
  mounted() {
    console.log(this.articleCategories)
    console.log(this.apollo)
  },
})
</script>

<style scoped></style>
