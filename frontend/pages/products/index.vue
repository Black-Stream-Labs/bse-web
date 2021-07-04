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

  data() {
    return {
      products: [],
    }
  },
  mounted() {
    this.$root.$on('search-products', async (data: string) => {
      await this.searchProducts(data)
    })
    this.$root.$on('updateProductSearch', async () => {
      await this.searchProducts()
    })
    this.$root.$on('clearProductFilters', () => {
      this.$nextTick(async () => {
        this.$router.push('/products')
        const data = await this.$strapi.graphql({
          query: allProdQuery(),
        })
        this.products = data.products
      })
    })
    this.searchProducts()
  },
  methods: {
    async searchProducts(data: [string, null]) {
      //  const prods = await this.$strapi.find('products', {
      //     product_name_contains: data,
      //   })
      //   this.products = prods
      // })
      let updatedProd = []
      const query = { ...this.$route.query }
      if (!!query && Object.keys(query).length > 0) {
        const queryEl = []
        Object.keys(query).forEach((queryType: string) => {
          if (queryType === 'product_categories') {
            if (
              decodeURIComponent(query.product_categories).split(',').length > 1
            ) {
              decodeURIComponent(query.product_categories)
                .split(',')
                .forEach((el: any) => {
                  queryEl.push(['product_categories.slug', el])
                })
            } else {
              queryEl.push([
                'product_categories.slug',
                query.product_categories,
              ])
            }
          }
          if (queryType === 'product_filter') {
            if (
              decodeURIComponent(query.product_filter).split(',').length > 1
            ) {
              decodeURIComponent(query.product_filter)
                .split(',')
                .forEach((el: any) => {
                  queryEl.push(['product_filter.slug', el])
                })
            } else {
              queryEl.push(['product_filter.slug', query.product_filter])
            }
          }
        })
        if (!!data && data !== 'undefined') {
          console.log(data, typeof data)

          const prod = await this.$strapi.find(
            'products',
            { product_name_contains: data },
            queryEl
          )
          updatedProd = prod
        } else {
          const prod = await this.$strapi.find(
            'products',

            queryEl
          )
          updatedProd = prod
        }
      } else {
        console.log('query query is empty')
        const data = await this.$strapi.graphql({
          query: allProdQuery(),
        })
        updatedProd = data.products
      }
      this.products = updatedProd.flat(1)
    },
  },
})
</script>
