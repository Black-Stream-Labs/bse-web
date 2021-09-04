<template>
  <div class="my-12">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <div class="col-span-2">
        <template v-for="(article, ind) in articles">
          <ArticleExtracts :key="ind" :article="article"></ArticleExtracts>
        </template>
      </div>
      <BlogSidebar> </BlogSidebar>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import BlogSidebar from '@/components/articles/BlogSidebar'
import ArticleExtracts from '@/components/articles/ArticleExtracts'

import imageUrlManipulation from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'BlogArticles',
  components: {
    BlogSidebar,
    ArticleExtracts,
  },
  mixins: [imageUrlManipulation],

  props: {
    articles: { type: Array, default: () => [] },
  },
  data() {
    return {
      searchInputValue: null,
    }
  },
  computed: {
    // articlesToDisplay() {
    //   const art = this.articles
    //   return art.splice(0, 5)
    // },
    // leftArticles() {
    //   return this.articles.slice(0, this.leftArticlesCount)
    // },
    // rightArticles() {
    //   return this.articles.slice(this.leftArticlesCount, this.articles.length)
    // },
  },
  methods: {},
})
</script>

<style scoped></style>
