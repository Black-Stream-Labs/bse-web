<template>
  <div>
    <Hero title="Article Categories"></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <CategoriesExtracts></CategoriesExtracts>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import CategoriesExtracts from '@/components/CategoriesExtracts'
export default Vue.extend({
  name: 'ArticlesPage',
  components: {
    CategoriesExtracts,
    Hero,
  },
  layout: 'blog',
  async asyncData({ app }) {
    const page = await app.$strapi.$http.$get('articles-page')
    return {
      page,
    }
  },
})
</script>

<style scoped></style>
