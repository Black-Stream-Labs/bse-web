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
        class="container max-w-5xl mx-auto px-4 py-24 dark:text-white"
        :class="$store.state.bgColor ? 'text-white' : ''"
      >
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>
    <section v-if="sectionUpdated" id="whatwedo" class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2>What we do</h2>
        <div class="grid gap-4 grid-rows-5">
          <div
            v-for="(section, ind) in sectionUpdated"
            :key="ind"
            class="row-span-1 py-5"
          >
            <div class="grid grid-cols-12">
              <div
                class="col-span-12 hover:text-white"
                :class="[
                  ind === 0 || ind === 4
                    ? 'md:col-start-1'
                    : ind === 1 || ind === 5
                    ? 'md:col-start-3'
                    : ind === 2 || ind === 6
                    ? 'md:col-start-5'
                    : ind === 3 || ind === 7
                    ? 'md:col-start-3'
                    : 'md:col-start-1',
                  'md:col-span-5',
                  $store.state.fullColor
                    ? $store.state.fullColor.name === 'tgreen'
                      ? 'hover:bg-tgreen '
                      : $store.state.fullColor.name === 'tpurple'
                      ? 'hover:bg-tpurple'
                      : $store.state.fullColor.name === 'tblue'
                      ? 'hover:bg-tblue'
                      : $store.state.fullColor.name === 'tbrown'
                      ? 'hover:bg-tbrown'
                      : ''
                    : $colorMode.preference === 'dark'
                    ? 'hover:bg-gray-700'
                    : 'hover:bg-gray-500',
                ]"
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
                    class="px-4 line-clamp-3 overflow-hidden"
                    v-html="$md.render(section.section_content)"
                  ></div>
                  <div class="text-right block w-full py-2">
                    <NuxtLink
                      :to="`/services/${section.title}`"
                      class="text-right p-2 text-xs uppercase hover:underline"
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
    <section
      id="whattheysay"
      class="section"
      :style="$store.state.bgColor ? $store.state.bgColor : ''"
    >
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2>What they say</h2>

        <TestimonialsComp
          :testimonials="updatedTestimonials"
        ></TestimonialsComp>
      </div>
    </section>
    <section class="section"></section>
    <section class="section"></section>
    <section class="section"></section>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <div class="grid grid-cols-2 gap-4">
          <div
            v-for="(article, ind) in articles"
            :key="ind"
            class="col-span-2 md:col-span-1 h-full"
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
import TestimonialsComp from '@/components/TestimonialsComp'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { homePageQuery } from '@/apollo/queries/pages/homepage.js'
import { articleExtracts } from '@/apollo/queries/blog/articles.js'
import { testimonialsExtracts } from '@/apollo/queries/testimonials/testimonialsExtracts.js'

import ArticleExtractsHomepage from '@/components/ArticleExtractsHomepage'

export default Vue.extend({
  name: 'SitePageTemplate',
  components: {
    Hero,
    ArticleExtractsHomepage,
    TestimonialsComp,
  },
  layout: 'default',
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: homePageQuery() })
    const articles = await $strapi.graphql({ query: articleExtracts() })
    const testimonials = await $strapi.graphql({
      query: testimonialsExtracts(),
    })
    return {
      page: data.homePage,
      articles: articles.articles,
      testimonials: testimonials.testimonials,
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
    updatedTestimonials() {
      const x = []
      this.testimonials.forEach((el: any) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
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
