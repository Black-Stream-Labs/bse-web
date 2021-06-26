<template>
  <div class="my-12">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <div class="col-span-2">
        <template v-for="product in products">
          <ProductExtract :key="product.id" :product="product">
          </ProductExtract>
        </template>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import ProductExtract from '@/components/ProductExtract'
export default Vue.extend({
  name: 'ProductsPage',
  components: {
    ProductExtract,
  },
  layout: 'product',

  props: {
    products: {
      type: Array,
      default: () => [],
    } as PropOptions,
  },
})
</script>
