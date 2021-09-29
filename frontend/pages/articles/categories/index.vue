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
    const date = new Date()
    const extra = data.articleCategories.map((el: any) => {
      const arts = el
      arts.articles = arts.articles.filter(
        (a: any) =>
          (a.future_publish_date === null && a.unpublish_date === null) ||
          (a.future_publish_date < date.toISOString() &&
            a.unpublish_date === null) ||
          (a.future_publish_date === null &&
            a.unpublish_date > date.toISOString()) ||
          (a.future_publish_date < date.toISOString() &&
            a.unpublish_date > date.toISOString())
      )
      return arts
    })
    return {
      categories: extra.flat(1),
    }
  },
})
</script>

<style scoped></style>
