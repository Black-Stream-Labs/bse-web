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
    )
    const date = new Date()
    const extra = author.map((el: any) => {
      const arts = el
      arts.articles = arts.articles.filter(
        (a: any) =>
          (a.future_publish_date === null && a.unpublish_date === null) ||
          (a.future_publish_date < date.toISOString() &&
            a.unpublish_date === null) ||
          (a.future_publish_date === null &&
            a.unpublish_date > date.toISOString()) ||
          (a.future_publish_date < date.toISOString() &&
            a.unpublish_date > date.toISOString())
      )
      return arts
    })
    console.log(extra[0])
    return {
      author: extra[0],
    }
  },
  computed: {
    updatedArticles() {
      const x = []
      this.author.articles.forEach((el: any) => {
        el.description = el.description ? el.description : el.content.content
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
