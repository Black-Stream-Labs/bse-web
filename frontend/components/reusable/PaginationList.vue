<template>
  <div class="">
    <ul v-if="pages" class="list-reset">
      <li class="inline-block bg-white hover:bg-blue-lightest border mr-1">
        <a
          href="#"
          class="no-underline text-grey-darker block py-3 px-4"
          :class="{
            'bg-grey-lightest text-grey cursor-not-allowed': currentPage == 1,
          }"
          @click.prevent="getPreviousPage"
          >Previous</a
        >
      </li>
      <li
        v-for="(page, index) in range"
        :key="index"
        class="
          inline-block
          bg-white
          hover:bg-blue-lightest
          border-t border-b border-l
        "
        :class="{ 'border-r': index == range.length - 1 }"
      >
        <a
          v-if="page != '...'"
          href="#"
          class="no-underline text-grey-darker block py-3 px-4"
          :class="{ 'bg-blue-lighter': page == currentPage }"
          @click.prevent="getPage(page)"
        >
          {{ page }}
        </a>
        <a
          v-else
          href="#"
          class="no-underline text-grey-darker block py-3 px-4"
        >
          {{ page }}
        </a>
      </li>
      <li class="inline-block bg-white hover:bg-blue-lightest border ml-1">
        <a
          href="#"
          class="no-underline text-grey-darker block py-3 px-4"
          :class="{
            'bg-grey-lightest text-grey cursor-not-allowed':
              currentPage >= pages,
          }"
          @click.prevent="getNextPage"
          >Next</a
        >
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
export default Vue.extend({
  name: 'Pagination',
  props: {
    pages: {
      type: Number,
      default: 0,
    },
    currentPage: {
      type: Number,
      default: 1,
    },
  },
  data() {
    return {
      range: [],
    }
  },
  computed: {},
  watch: {
    pages: {
      handler: 'organisePageLinks',
      immediate: true,
    },
    currentPage: {
      handler: 'organisePageLinks',
      immediate: true,
    },
  },
  methods: {
    organisePageLinks() {
      this.range = []
      for (let i = 1 as any; i <= this.pages; i++) {
        if (
          i === 1 || // first page
          i === this.pages || // last page
          i === this.currentPage || // current page
          i === this.currentPage - 1 || // page before current
          i === this.currentPage + 1 || // page after current
          (i <= 4 && this.currentPage < 4) || // "filler" links at start
          (i >= this.pages - 3 && this.currentPage > this.pages - 3) // "filler" links at end
        ) {
          const index = this.range.length
          if (index > 0 && this.range[index - 1] < i - 1) {
            // if this page is not the next one insequence, add in 3 dots "..."
            this.range.push('...')
          }
          this.range.push(i)
        }
      }
    },
    getPage(page: any) {
      this.$emit('page-changed', page)
    },
    getPreviousPage() {
      this.getPage(this.currentPage - 1)
    },
    getNextPage() {
      this.getPage(this.currentPage + 1)
    },
  },
})
</script>
