<template>
  <div>
    <Hero :title="`Articles by: ${author.username}`"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <div class="my-12">
          <div
            class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
          >
            <div class="col-span-2">
              <template v-for="(article, ind) in author.articles">
                <ArticleExtracts
                  :key="ind"
                  :article="article"
                ></ArticleExtracts>
              </template>
            </div>
            <BlogSidebar></BlogSidebar>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import BlogSidebar from '@/components/BlogSidebar'
import ArticleExtracts from '@/components/ArticleExtracts'
import { authors } from '@/apollo/queries/blog/authors.js'

export default Vue.extend({
  name: 'SingleAuthorPage',
  components: {
    Hero,
    BlogSidebar,
    ArticleExtracts,
  },
  data() {
    return {
      author: {},
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: authors(),
    })
    this.author = [...data.users].filter(
      (el) => el.username === this.$route.params.slug
    )[0]
  },
  fetchOnServer: true,
  fetchKey: 'single-author',
})
</script>

<style scoped></style>
