<template>
  <aside class="col-span-1">
    <div id="sidebar-search" class="mb-4">
      <span class="mb-2 font-bold"> Search Products: </span>
      <form class="md:pl-2 flex no-padding">
        <label for="searchinput" class="sr-only">Search products</label>
        <input
          id="searchinput"
          v-model="searchInputValue"
          class="
            border
            p-2
            focus:border-blue-500 focus:shadow-outline
            outline-none
            w-3/4
          "
          type="text"
          placeholder="Search..."
        />
        <button
          class="
            w-1/4
            border border-gray-100
            text-gray-100
            bg-gray-800
            flex
            place-items-center
            justify-center
            dark:bg-gray-700 dark:text-gray-300
          "
          type="submit"
          @click.prevent="searchProducts"
        >
          <svg
            class="fill-current dark:bg-gray-700 dark:text-gray-300 h-6"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
          >
            <path
              d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"
            />
          </svg>
        </button>
      </form>
    </div>
    <div id="sidebar-categs" class="mb-4">
      <span class="mb-2 font-bold">Categories</span>
      <ProductCategories></ProductCategories>
      <template v-if="$route.name === 'products'">
        <span class="mb-2 font-bold">Filters</span>
        <ProductFilters></ProductFilters>
      </template>
    </div>
  </aside>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import ProductCategories from '@/components/ProductCategories'
import ProductFilters from '@/components/ProductFilters'

export default Vue.extend({
  name: 'ProductsSidebar',
  components: {
    ProductCategories,
    ProductFilters,
  },
  data() {
    return {
      searchInputValue: null,
    }
  },
  methods: {
    searchProducts() {
      if (this.searchInputValue && this.searchInputValue.length > 2) {
        this.$root.$emit('search-products', this.searchInputValue)
      }
    },
  },
})
</script>

<style scoped></style>
