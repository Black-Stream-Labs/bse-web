<template>
  <Products :products="products" />
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { allProdQuery } from '@/apollo/queries/product/allProducts.js'
export default Vue.extend({
  name: 'MainProductPage',
  layout: 'product',
  data() {
    return {
      products: [],
    }
  },
  async fetch() {
    const { data } = await this.$strapi.graphql({
      query: allProdQuery(),
    })
    this.products = data.products
  },
})
</script>
