<template>
  <Products :products="category.products" />
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import singleCategory from '~/apollo/queries/product/category'
import { Categories } from '~/types'
export default Vue.extend({
  name: 'CategoryPage',
  layout: 'product',
  async fetch() {
    const { data } = await this.$apolloProvider.defaultClient.query({
      query: singleCategory,
      variables: {
        slug: this.$route.params.slug.toLowerCase(),
      },
    })
    this.category = data.categories[0]
  },
  data() {
    return {
      category: {} as Categories,
    }
  },
})
</script>
