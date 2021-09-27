<template>
  <div>
    <Hero title="Product Categories"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <ProductSecondaryCategories></ProductSecondaryCategories>
      </div>
    </section>
  </div>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import ProductSecondaryCategories from '@/components/shop/ProductSecondaryCategories'

export default Vue.extend({
  name: 'ProductSubCategoriesPage',
  components: {
    Hero,
    ProductSecondaryCategories,
  },
})
</script>
