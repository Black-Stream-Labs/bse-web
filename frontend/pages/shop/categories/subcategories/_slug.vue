<template>
  <div>
    <Hero
      v-if="singleCategory"
      :title="`Product Category: ${singleCategory.secondary_categ_name}`"
    ></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <div class="my-12">
          <div
            class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
          >
            <div class="col-span-2">
              <template v-for="(product, ind) in singleCategory.products">
                <ProductExtract :key="ind" :product="product"></ProductExtract>
              </template>
            </div>
            <ProductsSidebar :update-query="updateQuery"></ProductsSidebar>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import ProductsSidebar from '@/components/shop/ProductsSidebar'
import ProductExtract from '@/components/shop/ProductExtract'
import { productMainCategoriesQuery } from '@/apollo/queries/product/prodMainCategs.js'
export default Vue.extend({
  name: 'ProductSubCategoryPage',
  components: {
    Hero,
    ProductsSidebar,
    ProductExtract,
  },
  async asyncData({ app }) {
    const data = await app.$strapi.graphql({
      query: productMainCategoriesQuery(),
    })
    return {
      categories: data.productCategories,
    }
  },
  computed: {
    singleCategory() {
      const categs = this.categories
      return categs.filter((el: any) => el.slug === this.$route.params.slug)[0]
    },
  },
})
</script>
