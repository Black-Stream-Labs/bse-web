<template>
  <div class="md:pl-2 flex flex-wrap capitalize my-4">
    <div class="tab w-full overflow-hidden">
      <button
        class="flex justify-between align-center p-4 border w-full font-bold"
        @click="openedFilters = !openedFilters"
      >
        Categories
        <svg
          class="w-6 h-6 icon"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 20 20"
          fill="currentColor"
          :class="{ opened: openedFilters }"
        >
          <path
            d="M4.516 7.548c.436-.446 1.043-.481 1.576 0L10 11.295l3.908-3.747c.533-.481 1.141-.446 1.574 0 .436.445.408 1.197 0 1.615-.406.418-4.695 4.502-4.695 4.502a1.095 1.095 0 0 1-1.576 0S4.924 9.581 4.516 9.163c-.409-.418-.436-1.17 0-1.615z"
          />
        </svg>
      </button>
      <div class="" :class="openedFilters ? '' : 'hidden'">
        <div class="p-3">
          <label
            class="
              flex
              items-center
              mt-3
              font-light
              rounded
              px-2
              py-1
              m-1
              w-full
              bg-gray-200
              text-gray-800
              dark:bg-gray-700 dark:text-gray-300
            "
          >
            <input
              v-model="allCategories"
              type="checkbox"
              class="form-checkbox h-5 w-5 text-gray-600 dark:bg-gray-500"
              :checked="
                checkedMainCategories.length === 0 &&
                checkedSecondaryCategories.length === 0
              "
            />
            <span
              class="
                ml-2
                bg-gray-200
                text-gray-800
                dark:bg-gray-700 dark:text-gray-300
              "
            >
              All Categories
            </span>
          </label>
          <label
            v-for="cat in prodSecondCategs"
            :key="cat.slug"
            class="
              flex
              w-full
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
              v-model="checkedMainCategories"
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
              {{ cat.categ_name }}
            </span>
          </label>
          <label
            v-for="cat in prodMainCategs"
            :key="cat.slug"
            class="
              flex
              w-full
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
              v-model="checkedSecondaryCategories"
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
              {{ cat.categ_name }}
            </span>
          </label>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { productSecondaryCategoriesQuery } from '@/apollo/queries/product/prodSecondaryCategs.js'

import { productMainCategoriesQuery } from '@/apollo/queries/product/prodMainCategs.js'
export default Vue.extend({
  name: 'ProductSidebarCategories',

  data() {
    return {
      prodMainCategs: [],
      prodSecondCategs: [],
      checkedMainCategories: [],
      checkedSecondaryCategories: [],
      allCategories: true,
      openedFilters: false,
    }
  },
  async fetch() {
    const mainCat = await this.$strapi.graphql({
      query: productMainCategoriesQuery(),
    })
    const secondCat = await this.$strapi.graphql({
      query: productSecondaryCategoriesQuery(),
    })
    this.prodMainCategs = mainCat.productMainCategories

    this.prodSecondCategs = secondCat.productSecondaryCategories
  },
  watch: {
    allCategories(newValue, _oldValue) {
      if (newValue) {
        this.checkedCategories = []
      }
    },
    checkedMainCategories(newValue, _oldValue) {
      if (newValue.length === 0) {
        this.allCategories = true
        this.$root.$emit('updateFiltersCategories', {
          main_categ: null,
        })
      }

      if (newValue !== _oldValue && newValue.length > 0) {
        this.allCategories = false
        this.$root.$emit('updateFiltersCategories', {
          main_categ: encodeURIComponent(newValue),
        })
      }
    },
    checkedSecondaryCategories(newValue, _oldValue) {
      if (newValue.length === 0) {
        this.allCategories = true
        this.$root.$emit('updateFiltersCategories', {
          secondary_categ: null,
        })
      }

      if (newValue !== _oldValue && newValue.length > 0) {
        this.allCategories = false
        this.$root.$emit('updateFiltersCategories', {
          secondary_categ: encodeURIComponent(newValue),
        })
      }
    },
  },
  mounted() {
    if (this.$route.query && this.$route.query.main_categ) {
      this.checkedMainCategories = decodeURIComponent(
        this.$route.query.main_categ
      )
    }
    if (this.$route.query && this.$route.query.secondary_categ) {
      this.checkedSecondaryCategories = decodeURIComponent(
        this.$route.query.secondary_categ
      )
    }
    this.$root.$on('clearProductFilters', () => {
      this.allCategories = true
    })
  },
  beforeDestroy() {
    this.$root.$off()
  },
  fetchOnServer: true,
  fetchKey: 'product-categories',
})
</script>

<style scoped>
.icon {
  transition: transform 0.2s cubic-bezier(0.23, 1, 0.32, 1);
}
.icon.opened {
  transform: rotate(180deg);
}
</style>
