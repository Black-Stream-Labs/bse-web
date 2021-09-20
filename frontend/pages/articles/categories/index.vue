<template>
  <div>
    <Hero title="Article Categories"></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <CategoriesExtracts :categories="categories"></CategoriesExtracts>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import CategoriesExtracts from '@/components/articles/CategoriesExtracts'
import { categsExtra } from '@/apollo/queries/blog/categsExtra.js'

export default Vue.extend({
  name: 'ArticlesPage',
  components: {
    CategoriesExtracts,
    Hero,
  },
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({
      query: categsExtra(),
    })
    return {
      categories: data.articleCategories,
    }
  },
})
</script>

<style scoped></style>
