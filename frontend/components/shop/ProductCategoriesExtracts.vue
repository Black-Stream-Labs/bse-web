<template>
  <div class="py-10">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <main class="col-span-2">
        <div
          v-for="(category, ind) in prodCategExtracts"
          :key="ind"
          class="flex flex-col items-center justify-center"
        >
          <div class="w-full">
            Product Main Category:
            <NuxtLink :to="`/shop/categories/${category.slug}`">
              <b>
                {{ category.categ_name }} ({{ category.products.length }}
                articles)
              </b>
            </NuxtLink>
            Product Secondary Category:
            <NuxtLink :to="`/shop/categories/${category.slug}`">
              <b>
                {{ category.secondary_categ_name }} ({{
                  category.products.length
                }}
                articles)
              </b>
            </NuxtLink>
          </div>

          <article
            v-for="art in category.products"
            :key="art.id"
            class="
              rounded
              border
              hover:border-gray-600
              shadow
              w-full
              overflow-hidden
              md:flex
              my-2
            "
          >
            <ProductExtract :product="art"></ProductExtract>
          </article>
        </div>
      </main>
      <ProductsSidebar></ProductsSidebar>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck

import Vue from 'vue'
import ProductsSidebar from '@/components/shop/ProductsSidebar'
import ProductExtract from '@/components/shop/ProductExtract'

import imageUrlManipulation from '@/mixins/updateImageUrl.js'
import { productMainCategoriesQuery } from '@/apollo/queries/product/prodMainCategs.js'
export default Vue.extend({
  name: 'ProductCategoriesExtracts',
  components: { ProductsSidebar, ProductExtract },
  mixins: [imageUrlManipulation],
  props: {
    categories: { type: Array, default: () => [] },
  },
  data() {
    return {
      prodCategExtracts: [],
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: productMainCategoriesQuery(),
    })
    this.prodCategExtracts = data.productCategories
  },
  mounted() {},
  fetchOnServer: true,
  fetchKey: 'product-categories',
})
</script>

<style scoped></style>
