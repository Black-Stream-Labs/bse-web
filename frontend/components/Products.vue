<template>
  <div class="my-12">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <div class="col-span-2">
        <div
          v-if="products.length > 0"
          class="grid grid-cols-1 md:grid-cols-2 gap-4 p-2"
        >
          <template v-for="product in products">
            <ProductExtract :key="product.id" :product="product">
            </ProductExtract>
          </template>
        </div>
        <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-4 p-2">
          There are no products matching your filters. Please search for a
          differnt product or filter by different options from the sidebar.
        </div>
      </div>
      <ProductsSidebar></ProductsSidebar>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import ProductExtract from '@/components/ProductExtract'
import ProductsSidebar from '@/components/ProductsSidebar'
export default Vue.extend({
  name: 'ProductsPage',
  components: {
    ProductExtract,
    ProductsSidebar,
  },

  props: {
    products: {
      type: Array,
      default: () => [],
    } as PropOptions,
  },
})
</script>
