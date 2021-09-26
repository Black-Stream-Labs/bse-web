<template>
  <aside class="col-span-1">
    <div id="sidebar-search" class="mb-4">
      <span class="mb-2 font-bold"> Search Products: </span>
      <form class="md:pl-2 flex no-padding" @submit.prevent="updateSearch">
        <label for="searchinput" class="sr-only"> Search products </label>
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
          :disabled="
            searchInputValue === null ||
            (searchInputValue && searchInputValue.length < 3)
          "
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
          :class="
            searchInputValue && searchInputValue.length >= 3
              ? 'cursor-pointer'
              : 'cursor-not-allowed'
          "
          type="submit"
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
      <ProductSidebarCategories></ProductSidebarCategories>
      <!-- <ProductFilters></ProductFilters> -->
    </div>
    <div class="pt-5 text-center">
      <button
        class="
          mx-4
          px-3
          py-2
          text-sm
          border border-gray-700
          dark:bg-gray-900 dark:text-white dark:border-gray-50
          transition
          duration-500
          ease-in-out
          transform-gpu
          hover:scale-110
        "
        :disabled="
          !$route.query &&
          (!$route.query.product_categories || !$route.query.product_filters)
        "
        :class="[
          $store.state.fullColor
            ? $store.state.fullColor.name === 'tgreen'
              ? 'hover:bg-tgreen hover:text-white'
              : $store.state.fullColor.name === 'tpurple'
              ? 'hover:bg-tpurple hover:text-white'
              : $store.state.fullColor.name === 'tblue'
              ? 'hover:bg-tblue hover:text-white'
              : $store.state.fullColor.name === 'tbrown'
              ? 'hover:bg-tbrown hover:text-white'
              : ''
            : $colorMode.preference === 'dark'
            ? 'hover:bg-gray-700 hover:text-white'
            : 'hover:bg-gray-500 hover:text-white',
          $route.query &&
          ($route.query.product_categories || $route.query.product_filter)
            ? 'cursor-pointer'
            : 'cursor-not-allowed',
        ]"
        @click="updateSearchWithFilters"
      >
        Apply Filters
      </button>
      <button
        class="
          mx-4
          px-3
          py-2
          text-sm
          border border-gray-700
          dark:bg-gray-900 dark:text-white dark:border-gray-50
          transition
          duration-500
          ease-in-out
          transform-gpu
          hover:scale-110
        "
        :disabled="$route.query === null"
        :class="[
          $store.state.fullColor
            ? $store.state.fullColor.name === 'tgreen'
              ? 'hover:bg-tgreen hover:text-white'
              : $store.state.fullColor.name === 'tpurple'
              ? 'hover:bg-tpurple hover:text-white'
              : $store.state.fullColor.name === 'tblue'
              ? 'hover:bg-tblue hover:text-white'
              : $store.state.fullColor.name === 'tbrown'
              ? 'hover:bg-tbrown hover:text-white'
              : ''
            : $colorMode.preference === 'dark'
            ? 'hover:bg-gray-700 hover:text-white'
            : 'hover:bg-gray-500 hover:text-white',
          $route.query ? 'cursor-pointer' : 'cursor-not-allowed',
        ]"
        @click="updateSearch('show_all')"
      >
        Reset Filters
      </button>
    </div>
  </aside>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import ProductSidebarCategories from '@/components/products/ProductSidebarCategories'
// import ProductFilters from '@/components/products/ProductFilters'

export default Vue.extend({
  name: 'ProductsSidebar',
  components: {
    ProductSidebarCategories,
    // ProductFilters,
  },
  data(comp: unknown) {
    return {
      searchInputValue: comp.$route.query.q || null,
      products: [],
      filtersAndCategs: null,
    }
  },
  mounted() {
    this.$root.$on('clearProductFilters', () => {
      this.searchInputValue = null
    })
    this.$root.$on('updateFiltersCategories', (data) => {
      this.filtersAndCategs = data
    })
  },
  methods: {
    updateSearchWithFilters() {
      this.$root.$emit('filtersUpdated', this.filtersAndCategs)
    },
    updateSearch(data: string) {
      if (data === 'show_all') {
        this.$root.$emit('updateFromSidebar', data)
        this.searchInputValue = null
      } else if (this.searchInputValue && this.searchInputValue.length > 2) {
        this.$root.$emit('updateFromSidebar', { q: this.searchInputValue })
      } else {
        this.$root.$emit('updateFromSidebar', { q: null })
      }
    },

    beforeDestroy() {
      this.$root.$off()
    },
  },
})
</script>

<style scoped></style>
