<template>
  <div>
    <Hero title="Our Products"></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div class="my-12">
          <div
            class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
          >
            <div class="col-span-2">
              <div class="grid grid-cols-1 md:grid-cols-2 gap-4 p-2">
                <ProductMainCategories> </ProductMainCategories>
              </div>
            </div>
            <ProductsSidebar :update-query="updateQuery"></ProductsSidebar>
          </div>
        </div>
        <NuxtChild></NuxtChild>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import ProductMainCategories from '@/components/products/ProductMainCategories'

import ProductsSidebar from '@/components/products/ProductsSidebar'

import { allProdQuery } from '@/apollo/queries/product/allProducts.js'
export default Vue.extend({
  name: 'MainProductPage',
  components: {
    Hero,
    ProductMainCategories,
    ProductsSidebar,
  },
  data() {
    return {
      products: [],
    }
  },

  mounted() {
    this.searchProducts()
    this.$root.$on('clearProductFilters', () => {
      this.$router.push('/products')
      this.$nextTick(async () => {
        const data = await this.$strapi.graphql({
          query: allProdQuery(),
        })
        this.products = data.products
      })
    })
    this.$root.$on('updateFromSidebar', async (data: unknown) => {
      await this.updateQuery(data)
      await this.searchProducts()
    })
    this.$root.$on('filtersUpdated', async (data: unknown) => {
      await this.updateQuery(data)
      await this.searchProducts()
    })
  },
  methods: {
    searchProducts() {
      setTimeout(async () => {
        let updatedProd = []
        const query = await { ...this.$route.query }
        if (!!query && Object.keys(query).length > 0) {
          const queryEl = []
          Object.keys(query).forEach((queryType: string) => {
            if (queryType === 'q') {
              queryEl.push(['product_name_contains', query.q])
            }
            if (queryType === 'product_categories') {
              if (
                decodeURIComponent(query.product_categories).split(',').length >
                1
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
          const prod = await this.$strapi.find('products', queryEl)
          updatedProd = prod
        } else {
          const data = await this.$strapi.graphql({
            query: allProdQuery(),
          })
          updatedProd = data.products
        }
        this.products = updatedProd.flat(1)
      }, 350)
    },
    updateQuery(keyOrObj: any, value: any) {
      const updatedQuery = { ...this.$route.query }
      if (keyOrObj === 'show_all') {
        Object.keys(updatedQuery).forEach((key) => {
          delete updatedQuery[key]
        })
        this.$root.$emit('clearProductFilters')
      } else {
        const obj =
          typeof keyOrObj === 'string' ? { [keyOrObj]: value } : keyOrObj

        Object.keys(obj).forEach((key) => {
          const value = obj[key]

          if (value === null) {
            delete updatedQuery[key]
          } else {
            updatedQuery[key] = value
          }
        })
      }
      this.$router.push({ query: updatedQuery })
    },
  },
})
</script>
