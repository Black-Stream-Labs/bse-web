<template>
  <div>
    <Hero title="Product Categories"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <ProductCategoriesExtracts></ProductCategoriesExtracts>
      </div>
    </section>
  </div>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import ProductCategoriesExtracts from '@/components/ProductCategoriesExtracts'

export default Vue.extend({
  name: 'ProductCategoryPage',
  components: {
    Hero,
    ProductCategoriesExtracts,
  },
  layout: 'product',
})
</script>
