<template>
  <aside class="row-start-1 col-span-1">
    <div id="sidebar-search" class="mb-4">
      <span class="mb-4 font-bold"> Search Products: </span>
      <form class="flex no-padding" @submit.prevent="updateSearch">
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
    <div>
      <label for="#sortation" class="mb-4 font-bold">Sort Products by: </label>
      <div class="relative inline-block w-full text-gray-700">
        <select
          id="sortation"
          v-model="sortationFilter"
          class="
            w-full
            h-10
            pl-2
            pr-6
            text-base
            placeholder-gray-500
            border
            appearance-none
            focus:shadow-outline
          "
          placeholder="Select Sortation"
        >
          <option value="null" selected>Select Sortation</option>
          <option value="priceDescending">By Price High to Low</option>
          <option value="priceAscending">By Price Low to High</option>
          <option value="nameDescending">By Name A - Z</option>
          <option value="nameAscending">By Name Z - A</option>
          <option value="onlyDiscounts">Only Discounted Products</option>
        </select>
        <div
          class="
            absolute
            inset-y-0
            right-0
            flex
            items-center
            px-2
            pointer-events-none
          "
        >
          <svg class="w-4 h-4 fill-current" viewBox="0 0 20 20">
            <path
              d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
              clip-rule="evenodd"
              fill-rule="evenodd"
            ></path>
          </svg>
        </div>
      </div>
    </div>
    <!-- <div id="sidebar-categs" class="mb-4">
      <ProductSidebarCategories></ProductSidebarCategories>
      <ProductFilters></ProductFilters>
    </div> -->
    <div class="pt-5 text-center mb-10">
      <!-- <button
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
      </button> -->
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
          !$route.query.q &&
          !$route.query.main_categ &&
          !$route.query.secondary_categ
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
          !$route.query.q &&
          !$route.query.main_categ &&
          !$route.query.secondary_categ
            ? 'cursor-not-allowed'
            : 'cursor-pointer',
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
// import ProductSidebarCategories from '@/components/shop/ProductSidebarCategories'
// import ProductFilters from '@/components/shop/ProductFilters'

export default Vue.extend({
  name: 'ProductsSidebar',
  components: {
    // ProductSidebarCategories,
    // ProductFilters,
  },
  data(comp: unknown) {
    return {
      searchInputValue: comp.$route.query.q || null,
      products: [],
      filtersAndCategs: null,
      sortationFilter: null,
    }
  },
  watch: {
    sortationFilter(newValue, oldValue) {
      if (newValue === 'null') {
        console.log('reset sortation but keep other things')
      }
      if (newValue !== oldValue) {
        console.log(newValue)
        console.log(
          'start sortation with all the other things and hide categories'
        )
      }
    },
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
