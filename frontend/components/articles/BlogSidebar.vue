<template>
  <aside class="col-span-1">
    <div id="sidebar-search" class="mb-4">
      <span class="mb-2 font-bold"> Search articles: </span>
      <form class="md:pl-2 flex no-padding" @submit.prevent="searchArticles">
        <label for="searchinput" class="sr-only">Search articles</label>
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
            flex
            place-items-center
            justify-center
            dark:bg-gray-700 dark:text-gray-300
          "
          :disabled="
            searchInputValue === null ||
            (searchInputValue && searchInputValue.length < 3)
          "
          :class="[
            $store.state.fullColor
              ? $store.state.fullColor.name === 'tgreen'
                ? 'bg-tgreen '
                : $store.state.fullColor.name === 'tpurple'
                ? 'bg-tpurple'
                : $store.state.fullColor.name === 'tblue'
                ? 'bg-tblue'
                : $store.state.fullColor.name === 'tbrown'
                ? 'bg-tbrown'
                : ''
              : $colorMode.preference === 'dark'
              ? 'bg-gray-700'
              : 'bg-gray-500',
            searchInputValue && searchInputValue.length >= 3
              ? 'cursor-pointer'
              : 'cursor-not-allowed',
          ]"
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
      <span class="mb-2 font-bold">Categories</span>
      <BlogCategories></BlogCategories>
    </div>
    <div id="sidebar-authors" class="mb-4">
      <span class="mb-2 font-bold">Authors</span>
      <BlogAuthors></BlogAuthors>
    </div>
    <div
      v-if="$route.query && $route.query.q"
      id="sidebar-clearBtn"
      class="mb-4 flex items-center justify-center"
    >
      <a
        href="#"
        class="
          inline-flex
          items-center
          w-max
          px-2
          py-2
          capitalize
          border border-gray-400
          text-white
          dark:border-gray-50
        "
        aria-label="Go Back to Product Summary including the Search Terms and Filters"
        :class="
          $store.state.fullColor
            ? $store.state.fullColor.name === 'tgreen'
              ? 'bg-tgreen '
              : $store.state.fullColor.name === 'tpurple'
              ? 'bg-tpurple'
              : $store.state.fullColor.name === 'tblue'
              ? 'bg-tblue'
              : $store.state.fullColor.name === 'tbrown'
              ? 'bg-tbrown'
              : ''
            : $colorMode.preference === 'dark'
            ? 'bg-gray-700'
            : 'bg-gray-500'
        "
        @click.prevent="removeArticleQuery"
      >
        <span class="px-4"> clear search </span>
      </a>
    </div>
  </aside>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import BlogCategories from '@/components/articles/BlogCategories'
import BlogAuthors from '@/components/articles/BlogAuthors'

export default Vue.extend({
  name: 'BlogSidebar',
  components: {
    BlogCategories,
    BlogAuthors,
  },
  props: {
    removeArticleQuery: {
      type: Function,
      default: () => 1,
    },
  },
  data(comp: any) {
    return {
      searchInputValue: comp.$route.query.q || null,
    }
  },
  mounted() {
    this.$root.$on('clearArticleSearchTerm', () => {
      this.searchInputValue = null
    })
  },
  beforeDestroy() {
    this.$root.$off()
  },
  methods: {
    searchArticles() {
      if (this.searchInputValue && this.searchInputValue.length > 2) {
        this.$root.$emit('search-articles', this.searchInputValue)
      }
    },
  },
})
</script>

<style scoped></style>
