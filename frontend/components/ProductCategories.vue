<template>
  <div class="md:pl-2 flex flex-wrap text-xs capitalize">
    <NuxtLink
      to="/products/categories"
      class="
        text-gray-500
        font-light
        rounded
        bg-gray-200
        px-2
        py-1
        m-1
        dark:bg-gray-700 dark:text-gray-300
      "
    >
      All Categories
    </NuxtLink>
    <NuxtLink
      v-for="cat in prodCategs"
      :key="cat.slug"
      :to="`/products/categories/${cat.slug}`"
      class="
        text-gray-500
        font-light
        rounded
        bg-gray-200
        px-2
        py-1
        m-1
        dark:bg-gray-700 dark:text-gray-300
      "
    >
      {{ cat.categ_name }}
    </NuxtLink>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { productCategoriesQuery } from '@/apollo/queries/product/prodCategs.js'
export default Vue.extend({
  name: 'ProductCategories',
  data() {
    return {
      prodCategs: [],
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: productCategoriesQuery(),
    })
    this.prodCategs = data.productCategories
  },
  fetchOnServer: true,
  fetchKey: 'article-categories',
})
</script>

<style scoped></style>
