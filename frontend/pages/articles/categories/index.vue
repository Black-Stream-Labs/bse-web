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
import Hero from '@/components/hero/Hero'
import CategoriesExtracts from '@/components/articles/CategoriesExtracts'
export default Vue.extend({
  name: 'ArticlesPage',
  components: {
    CategoriesExtracts,
    Hero,
  },
  layout: 'blog',
})
</script>

<style scoped></style>
