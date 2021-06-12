<template>
  <aside class="col-span-1">
    <div id="sidebar-search" class="mb-4">
      <span class="mb-2 font-bold"> Search articles: </span>
      <div class="md:pl-2 flex no-padding">
        <label for="searchinput" class="sr-only">Search articles</label>
        <input
          id="searchinput"
          v-model="searchInputValue"
          class="border p-2 focus:border-blue-500 focus:shadow-outline outline-none w-3/4"
          type="text"
          placeholder="Search..."
        />
        <button
          class="w-1/4 border border-gray-100 bg-gray-800 flex align-center justify-center"
          @click="searchArticles"
        >
          <svg
            class="fill-current h-6 w-6 text-gray-400"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
          >
            <path
              d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"
            />
          </svg>
        </button>
      </div>
    </div>
    <div id="sidebar-categs" class="mb-4">
      <span class="mb-2 font-bold">Categories</span>
      <BlogCategories></BlogCategories>
    </div>
    <div id="sidebar-authors" class="mb-4">
      <span class="mb-2 font-bold">Authors</span>
      <BlogAuthors></BlogAuthors>
    </div>
  </aside>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import BlogCategories from '@/components/BlogCategories'
import BlogAuthors from '@/components/BlogAuthors'

export default Vue.extend({
  name: 'BlogSidebar',
  components: {
    BlogCategories,
    BlogAuthors,
  },
  data() {
    return {
      searchInputValue: null,
    }
  },
  methods: {
    searchArticles() {
      if (this.searchInputValue) {
        console.log(this.searchInputValue)
      }
    },
  },
})
</script>

<style scoped></style>
