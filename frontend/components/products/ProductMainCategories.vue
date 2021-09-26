<template>
  <div>
    <div v-for="item in mainCategs" :key="item.id">
      {{ item }}
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { productMainCategoriesQuery } from '@/apollo/queries/product/prodMainCategs.js'

export default Vue.extend({
  name: 'ProductMainCategories',
  data() {
    return {
      mainCategs: [],
    }
  },
  async fetch() {
    const cats = await this.$strapi.graphql({
      query: productMainCategoriesQuery(),
    })
    this.mainCategs = cats.productMainCategories
  },
})
</script>

<style scoped></style>
