<template>
  <div>
    <Hero
      v-if="page"
      title="Latest News"
      :subtitle="page.subtitle"
      :headerimage="updatedHeaderIMage"
    ></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div v-html="$md.render(updatedContent)"></div>
        </div>
        <div class="my-12">
          <div
            class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
          >
            <div v-if="articles && articles.length > 0" class="col-span-2">
              <template v-for="(article, ind) in articles">
                <ArticleExtracts
                  :key="ind"
                  :article="article"
                ></ArticleExtracts>
              </template>
            </div>
            <div v-else class="col-span-2 text-center">
              <p>
                No Articles matched your query
                <span class="text-xl italic">
                  <b>{{ searchInputValue }}</b>
                </span>
              </p>
            </div>
            <BlogSidebar
              :update-article-query="updateArticleQuery"
              :remove-article-query="removeArticleQuery"
            >
            </BlogSidebar>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import BlogSidebar from '@/components/articles/BlogSidebar'
import ArticleExtracts from '@/components/articles/ArticleExtracts'

import { articleExtracts } from '@/apollo/queries/blog/articles.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
const qs = require('qs')
export default Vue.extend({
  name: 'ArticlesPage',
  components: {
    Hero,
    BlogSidebar,
    ArticleExtracts,
  },
  layout: 'blog',
  async asyncData({ app, route }) {
    const page = await app.$strapi.$http.$get('articles-page')
    let arts = []
    let art
    let updatedQ
    let searchTerm = null
    const date = new Date()
    const queryEl = []
    if (route.query.q) {
      queryEl.push({
        _or: [
          [
            { title_contains: route.query.q },
            { future_publish_date_null: true },
            { unpublish_date_null: true },
          ],
          [
            { title_contains: route.query.q },
            { future_publish_date_lt: date.toISOString() },
            { unpublish_date_lt: date.toISOString() },
          ],
          [
            { title_contains: route.query.q },
            { future_publish_date_lt: date.toISOString() },
            { unpublish_date_null: true },
          ],
          [
            { title_contains: route.query.q },
            { future_publish_date_null: true },
            { unpublish_date_gt: date.toISOString() },
          ],
          [
            { title_contains: route.query.q },
            { future_publish_date_lt: date.toISOString() },
            { unpublish_date_gt: date.toISOString() },
          ],
        ],
        // _or: [],
      })
      searchTerm = decodeURIComponent(route.query.q)
      updatedQ = qs.stringify({ _where: queryEl })
      art = await app.$strapi.find('articles', updatedQ)
      arts = art
    } else {
      // queryEl.push({ future_publish_date_lt: date.toISOString() })
      queryEl.push({
        _or: [
          [{ future_publish_date_null: true }, { unpublish_date_null: true }],
          [
            { future_publish_date_lt: date.toISOString() },
            { unpublish_date_null: true },
          ],
          [
            { future_publish_date_null: true },
            { unpublish_date_gt: date.toISOString() },
          ],
          [
            { future_publish_date_lt: date.toISOString() },
            { unpublish_date_gt: date.toISOString() },
          ],
        ],
      })
      updatedQ = qs.stringify({ _where: queryEl })
      art = await app.$strapi.find('articles', updatedQ)
      arts = art
    }
    const articles = []
    arts.forEach((el: any) => {
      const e = JSON.stringify(el)
      articles.push(JSON.parse(formatContentImageUrl(e)))
    })
    articles.sort((a: any, b: any) => a.published_at - b.published_at)
    return {
      page,
      articles,
      searchInputValue: searchTerm,
    }
  },
  computed: {
    updatedContent() {
      if (this.page.content && this.page.content.content.length > 0) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return null
      }
    },
    updatedHeaderIMage() {
      if (this.page.content && this.page.content.header_image) {
        return this.page.content.header_image.url
      } else {
        return null
      }
    },
  },
  mounted() {
    this.$root.$on('search-articles', async (data: unknown) => {
      this.updateArticleQuery('q', data)
      this.searchInputValue = data
      const artc = await this.$strapi.find('articles', {
        title_contains: data,
      })
      this.articles = artc
    })
  },
  beforeDestroy() {
    this.$root.$off()
  },
  methods: {
    async removeArticleQuery() {
      const articles = await this.$strapi.graphql({ query: articleExtracts() })
      this.articles = articles.articles
      this.searchInputValue = null
      this.$root.$emit('clearArticleSearchTerm')
      this.updateArticleQuery('show_all')
    },
    updateArticleQuery(keyOrObj: any, value: any) {
      const updatedQuery = { ...this.$route.query }
      if (keyOrObj === 'show_all') {
        Object.keys(updatedQuery).forEach((key) => {
          delete updatedQuery[key]
        })
        this.$root.$emit('clearProductFilters')
      } else {
        const obj =
          typeof keyOrObj === 'string' ? { [keyOrObj]: value } : keyOrObj

        Object.keys(obj).forEach((key) => {
          const value = obj[key]

          if (value === null) {
            delete updatedQuery[key]
          } else {
            updatedQuery[key] = value
          }
        })
      }
      this.$router.push({ query: updatedQuery })
    },
  },
})
</script>

<style scoped></style>
