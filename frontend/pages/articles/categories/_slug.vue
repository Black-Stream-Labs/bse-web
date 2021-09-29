<template>
  <div>
    <Hero v-if="singleCategory" :title="singleCategory.category"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <div class="my-12">
          <div
            class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
          >
            <div class="col-span-2">
              <template v-for="(article, ind) in singleCategory">
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
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'

import { categsExtra } from '@/apollo/queries/blog/categsExtra.js'

export default Vue.extend({
  name: 'SingleCategoryPage',
  components: {
    Hero,
    BlogSidebar,
    ArticleExtracts,
  },
  async asyncData({ app }) {
    const data = await app.$strapi.graphql({
      query: categsExtra(),
    })
    const date = new Date()
    const extra = data.articleCategories.map((el: any) => {
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
    return {
      categories: extra,
    }
  },
  computed: {
    singleCategory() {
      const categs = this.categories.filter(
        (el: any) => el.slug === this.$route.params.slug
      )[0]
      const x = []
      categs.articles.forEach((el: any) => {
        el.description = el.description ? el.description : el.content.content
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },
  },
})
</script>
