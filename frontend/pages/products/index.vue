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
  async asyncData({ app }) {
    const data = await app.$strapi.graphql({
      query: allProdQuery(),
    })
    return { products: data.products }
  },
  mounted() {
    this.$root.$on('updateProductFilters', async (query: any) => {
      let updatedProd = []
      if (!!query && query !== 'undefined') {
        if (query.split(',').length > 1) {
          const queryEl = []
          query.split(',').forEach((el: any) => {
            queryEl.push(['product_filter.slug', el])
          })
          const prod = await this.$strapi.find('products', queryEl)
          updatedProd.push(prod)
        } else {
          const prod = await this.$strapi.find('products', {
            'product_filter.slug': query.split('&'),
          })

          updatedProd.push(prod)
        }
      } else {
        const data = await this.$strapi.graphql({
          query: allProdQuery(),
        })
        updatedProd = data.products
      }
      this.products = updatedProd.flat(1)
    })
  },
})
</script>
