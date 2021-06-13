<template>
  <Products :products="category.products" />
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { singleprogCategQuery } from '~/apollo/queries/product/prodSingleCateg.js'
import { Categories } from '~/types'
export default Vue.extend({
  name: 'CategoryPage',
  layout: 'product',
  data() {
    return {
      category: {} as Categories,
    }
  },
  async fetch() {
    const { data } = await this.$strapi.graphql({
      query: singleprogCategQuery(),
      variables: {
        slug: this.$route.params.slug.toLowerCase(),
      },
    })
    this.category = data.categories[0]
  },
})
</script>
