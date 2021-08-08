<template>
  <div>
    <Hero
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="updatedHeaderIMage"
    ></Hero>
    <section v-if="updatedMotto" class="section py-24">
      <div class="container max-w-3xl mx-auto px-4 py-10 text-center">
        <div v-html="$md.render(updatedMotto)" />
      </div>
    </section>
    <section
      class="section"
      :style="$store.state.bgColor ? $store.state.bgColor : ''"
    >
      <div
        class="container max-w-5xl mx-auto px-4 py-24"
        :class="$store.state.bgColor ? 'text-white' : ''"
      >
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2>What we do</h2>
        <div :class="`grid gap-4 grid-rows-${sectionUpdated.length + 1}`">
          <div
            v-for="(section, ind) in sectionUpdated"
            :key="ind"
            class="row-span-1 py-10"
          >
            <div class="grid grid-cols-12">
              <div
                class="col-span-12"
                :class="`md:col-start-${
                  ind === 0
                    ? 1
                    : ind === 1
                    ? 3
                    : ind === 2 || ind === 4
                    ? 5
                    : ind === 3 || ind === 6
                    ? 3
                    : 1
                } md:col-span-5`"
              >
                <div
                  class="
                    border border-gray-700
                    dark:border-gray-50
                    p-4
                    flex flex-wrap
                  "
                >
                  <img
                    v-if="section.section_image"
                    :src="section.section_image.url"
                    alt=""
                    class="image p-4"
                    width="80"
                    height="80"
                  />
                  <div
                    class="px-4 line-clamp-3"
                    v-html="$md.render(section.section_content)"
                  ></div>
                  <div class="text-right block w-full">
                    <NuxtLink
                      :to="`/services/${section.title}`"
                      class="
                        text-right
                        py-2
                        text-indigo-600 text-xs
                        uppercase
                        hover:underline
                      "
                    >
                      Read More <span>&rarr;</span>
                    </NuxtLink>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section"></section>
    <section class="section"></section>
    <section class="section"></section>
    <section class="section"></section>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <div class="grid grid-cols-2 gap-4">
          <div
            v-for="(article, ind) in articles"
            :key="ind"
            class="col-span-2 md:col-span-1"
          >
            <ArticleExtractsHomepage
              :article="article"
            ></ArticleExtractsHomepage>
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
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { homePageQuery } from '@/apollo/queries/pages/homepage.js'
import { articleExtracts } from '@/apollo/queries/blog/articles.js'

import ArticleExtractsHomepage from '@/components/ArticleExtractsHomepage'

export default Vue.extend({
  name: 'SitePageTemplate',
  components: {
    Hero,
    ArticleExtractsHomepage,
  },
  layout: 'default',
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: homePageQuery() })
    const articles = await $strapi.graphql({ query: articleExtracts() })
    // console.log(articles)
    return {
      page: data.homePage,
      articles: articles.articles,
    }
  },
  computed: {
    updatedContent() {
      if (this.page.content) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return null
      }
    },
    updatedMotto() {
      if (this.page.motto) {
        return formatContentImageUrl(this.page.motto)
      } else {
        return null
      }
    },
    sectionUpdated() {
      if (!this.page.sections) return
      const x = []
      this.page.sections.forEach((el: any) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },
    updatedHeaderIMage() {
      if (this.page.content && this.page.content.header_image) {
        return this.page.content.header_image.url
      } else {
        return null
      }
    },
  },
})
</script>

<style scoped lang="postcss">
.column &.is-reversed &:nth-child(odd) {
  order: 2;
}
.column &.is-reversed &:nth-child(even) {
  order: 1;
}
</style>
