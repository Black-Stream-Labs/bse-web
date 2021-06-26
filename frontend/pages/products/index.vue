<template>
  <div>
    <Hero title="Our Products"></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <Products :products="products" />
        <NuxtChild></NuxtChild>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import Products from '@/components/Products'
import { allProdQuery } from '@/apollo/queries/product/allProducts.js'
export default Vue.extend({
  name: 'MainProductPage',
  components: {
    Products,
    Hero,
  },
  layout: 'product',
  async asyncData({ app }) {
    const data = await app.$strapi.graphql({
      query: allProdQuery(),
    })
    return { products: data.products }
  },
})
</script>
