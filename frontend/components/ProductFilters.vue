<template>
  <div class="md:pl-2 flex flex-col text-xs capitalize">
    <label
      class="
        inline-flex
        items-center
        mt-3
        font-light
        rounded
        px-2
        py-1
        m-1
        bg-gray-200
        text-gray-800
        dark:bg-gray-700 dark:text-gray-300
      "
    >
      <input
        v-model="allFilters"
        type="checkbox"
        class="form-checkbox h-5 w-5 text-gray-600 dark:bg-gray-500"
        :checked="checkedFilters.length === 0"
      />
      <span
        class="
          ml-2
          bg-gray-200
          text-gray-800
          dark:bg-gray-700 dark:text-gray-300
        "
      >
        All Filters
      </span>
    </label>

    <label
      v-for="cat in prodFilters"
      :key="cat.slug"
      class="
        inline-flex
        items-center
        mt-3
        font-light
        rounded
        bg-gray-200
        text-gray-800
        px-2
        py-1
        m-1
        dark:bg-gray-700 dark:text-gray-300
      "
    >
      <input
        v-model="checkedFilters"
        :value="cat.slug"
        type="checkbox"
        class="form-checkbox h-5 w-5 text-gray-600 dark:bg-gray-500"
      />
      <span
        class="
          ml-2
          bg-gray-200
          text-gray-800
          dark:bg-gray-700 dark:text-gray-300
        "
      >
        {{ cat.filter_name }}
      </span>
    </label>
    <div class="pt-5 text-center">
      <button
        class="
          mx-4
          px-3
          py-2
          text-sm
          border
          rounded
          border-gray-400
          dark:bg-gray-900 dark:text-white dark:border-gray-50
        "
        @click="searchWithFilters"
      >
        Apply Filters
      </button>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { productFiltersQuery } from '@/apollo/queries/product/prodFilters.js'
export default Vue.extend({
  name: 'ProductFilters',
  data() {
    return {
      prodFilters: [],
      checkedFilters: [],
      allFilters: false,
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: productFiltersQuery(),
    })
    this.prodFilters = data.productFilters
  },
  watch: {
    checkedFilters(newValue, oldValue) {
      if (newValue.length === 0) {
        this.allFilters = true
        this.$router.push('/products')
        // this.$root.$emit('updateProductFilters', 'undefined')
      }

      if (newValue !== oldValue && newValue.length > 0) {
        this.$router.push({
          query: { product_filters: encodeURIComponent(newValue) },
        })
        this.allFilters = false
      }
    },
  },
  methods: {
    searchWithFilters() {
      const query = decodeURIComponent(this.$route.query.product_filters)
      this.$root.$emit('updateProductFilters', query)
    },
  },

  fetchOnServer: true,
  fetchKey: 'product-filters',
})
</script>

<style scoped></style>
