<template>
  <Products :products="products" />
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import allProducts from '@/apollo/queries/product/products.gql'
export default Vue.extend({
  name: 'MainProductPage',
  layout: 'product',
  async fetch() {
    const { data } = await this.$apolloProvider.defaultClient.query({
      query: allProducts,
    })
    this.products = data.products
  },
  data() {
    return {
      products: [],
    }
  },
})
</script>
