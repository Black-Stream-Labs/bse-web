<template>
  <div>
    <Hero v-if="author" :title="`Articles by: ${author.username}`"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <div class="my-12">
          <div
            class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
          >
            <div class="col-span-2">
              <template v-for="(article, ind) in updatedArticles">
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
import Hero from '@/components/hero/Hero'
import BlogSidebar from '@/components/articles/BlogSidebar'
import ArticleExtracts from '@/components/articles/ArticleExtracts'
import { authors } from '@/apollo/queries/blog/authors.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'SingleAuthorPage',
  components: {
    Hero,
    BlogSidebar,
    ArticleExtracts,
  },
  async asyncData({ $strapi, route }) {
    const data = await $strapi.graphql({
      query: authors(),
    })
    const author = [...data.users].filter(
      (el) => el.username === route.params.slug
    )[0]
    return {
      author,
    }
  },
  computed: {
    updatedArticles() {
      const x = []
      this.author.articles.forEach((el: any) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },
  },

  fetchOnServer: true,
  fetchKey: 'single-author',
})
</script>

<style scoped></style>
