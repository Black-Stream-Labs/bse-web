<template>
  <div>
    <div v-for="item in secondaryCategs" :key="item.id">
      {{ item }}
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { productSecondaryCategoriesQuery } from '@/apollo/queries/product/prodSecondaryCategs.js'

export default Vue.extend({
  name: 'ProductSecondaryCategories',
  data() {
    return {
      secondaryCategs: [],
    }
  },
  async fetch() {
    const cats = await this.$strapi.graphql({
      query: productSecondaryCategoriesQuery(),
    })
    this.mainCategs = cats.productMainCategories
  },
})
</script>

<style scoped></style>
