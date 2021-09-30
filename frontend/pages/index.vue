<template>
  <div>
    <Hero
      v-if="page"
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
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
          : ''
      "
    >
      <div
        class="container max-w-5xl mx-auto px-4 py-24 dark:text-white"
        :class="$store.state.fullColor ? 'text-white' : ''"
      >
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>
    <section v-if="sectionUpdated" id="whatwedo" class="section">
      <!-- <section
      v-if="sectionUpdated"
      id="whatwedo"
      class="section"
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
          : ''
      "
    > -->
      <div class="container max-w-5xl mx-auto px-4 py-10 dark:text-white">
        <h2>What we do</h2>
        <div class="grid gap-4" :class="`grid-rows-${sectionUpdated.length}`">
          <div
            v-for="(section, ind) in sectionUpdated"
            :key="ind"
            class="row-span-1 py-5"
          >
            <div class="grid grid-cols-12">
              <div
                class="
                  col-span-12
                  md:col-span-8
                  transition
                  duration-500
                  ease-in-out
                  transform-gpu
                  hover:text-white
                  hover:translate-x-1
                  hover:translate-y-1
                  hover:scale-105
                "
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
                @mouseenter="updateVisibility(ind, true)"
                @mouseleave="updateVisibility(ind, false)"
              >
                <div
                  class="
                    shadow-lg
                    relative
                    border border-gray-700
                    dark:border-gray-50
                    p-4
                    flex flex-wrap
                  "
                >
                  <badger-icon
                    v-if="ind === 0"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></badger-icon>
                  <bee-icon
                    v-if="ind === 1"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></bee-icon>
                  <butterfly-icon
                    v-if="ind === 2"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></butterfly-icon>
                  <fish-icon
                    v-if="ind === 3"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></fish-icon>
                  <stag-icon
                    v-if="ind === 4"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></stag-icon>
                  <fox-icon
                    v-if="ind === 5"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></fox-icon>
                  <bee-icon
                    v-if="ind === 6"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></bee-icon>
                  <owl-icon
                    v-if="ind === 7"
                    :width="150"
                    :height="150"
                    :color="
                      section.visible
                        ? 'white'
                        : $store.state.fullColor
                        ? $store.state.fullColor.name === 'tgreen'
                          ? '#676B3B'
                          : $store.state.fullColor.name === 'tpurple'
                          ? '#673B6B'
                          : $store.state.fullColor.name === 'tblue'
                          ? '#3B4F6C'
                          : $store.state.fullColor.name === 'tbrown'
                          ? '#7F6127'
                          : 'white'
                        : $colorMode.preference === 'dark'
                        ? 'white'
                        : 'white'
                    "
                  ></owl-icon>
                  <!-- <img
                    v-if="section.section_image && section.visible"
                    loading="lazy"
                    :src="section.section_image.url"
                    :alt="`${section.section_title} image`"
                    class="
                      image
                      p-4
                      absolute
                      top-5
                      left-auto
                      right-auto
                      bottom-auto
                    "
                    width="120"
                    height="120"
                  /> -->
                  <div
                    class="px-4"
                    v-html="$md.render(section.section_content)"
                  ></div>
                  <!-- <div class="text-right block w-full py-2">
                    <NuxtLink
                      :to="`/services/#${$slugify(
                        section.section_title
                      )}-${ind}`"
                      class="text-right p-2 text-xs uppercase hover:underline"
                    >
                      Read More <span>&rarr;</span>
                    </NuxtLink>
                  </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section v-if="servicesUpdated" id="whatwedo" class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2>Our Services</h2>
        <div class="grid gap-4" :class="`grid-rows-${servicesUpdated.length}`">
          <div
            v-for="(section, ind) in servicesUpdated"
            :key="ind"
            class="row-span-1 py-5"
          >
            <div class="grid grid-cols-12">
              <div
                class="
                  col-span-12
                  hover:text-white
                  transition
                  duration-500
                  ease-in-out
                  transform-gpu
                  hover:translate-x-1 hover:translate-y-1 hover:scale-105
                "
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
                    shadow-lg
                    border border-gray-700
                    dark:border-gray-50
                    p-4
                    flex flex-wrap
                  "
                >
                  <img
                    v-if="section.section_image"
                    loading="lazy"
                    :src="section.section_image.url"
                    :alt="`${section.title} image`"
                    class="image p-4"
                    width="120"
                    height="120"
                  />
                  <div
                    class="px-4 line-clamp-3 overflow-hidden"
                    v-html="$md.render(section.section_content)"
                  ></div>
                  <div class="text-right block w-full py-2">
                    <NuxtLink
                      :to="`/services/#${$slugify(
                        section.section_title
                      )}-${ind}`"
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
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-start) 0%, var(--background-end) 100%)`
          : ''
      "
    >
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2 class="text-gray-50">What they say</h2>

        <TestimonialsComp
          :testimonials="updatedTestimonials"
        ></TestimonialsComp>
      </div>
    </section>
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
import ButterflyIcon from '../components/icons/ButterflyIcon.vue'
import FishIcon from '../components/icons/FishIcon.vue'
import StagIcon from '../components/icons/StagIcon.vue'
import FoxIcon from '../components/icons/FoxIcon.vue'
import BeeIcon from '../components/icons/BeeIcon.vue'
import OwlIcon from '../components/icons/OwlIcon.vue'
import BadgerIcon from '../components/icons/BadgerIcon.vue'
import Hero from '@/components/hero/Hero'
import TestimonialsComp from '@/components/testimonials/TestimonialsComp'
import ArticleExtractsHomepage from '@/components/articles/ArticleExtractsHomepage'
import slugify from '@/mixins/slugify.js'

import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { homePageQuery } from '@/apollo/queries/pages/homepage.js'
import { testimonialsExtracts } from '@/apollo/queries/testimonials/testimonialsExtracts.js'
import { servicesQuery } from '@/apollo/queries/pages/services.js'
const qs = require('qs')
export default Vue.extend({
  name: 'SitePageTemplate',
  components: {
    Hero,
    ArticleExtractsHomepage,
    TestimonialsComp,
    FishIcon,
    ButterflyIcon,
    BeeIcon,
    BadgerIcon,
    FoxIcon,
    OwlIcon,
    StagIcon,
  },
  mixins: [slugify],

  layout: 'default',
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: homePageQuery() })
    const services = await $strapi.graphql({ query: servicesQuery() })
    const date = new Date()
    const queryEl = []
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
      _and: [{ featured: true }],
    })
    const updatedQ = qs.stringify({ _where: queryEl })

    const arts = await $strapi.find('articles', updatedQ)
    const articles = arts
    // .filter(
    //       (el: any) =>
    //         el.future_publish_date === null ||
    //         el.future_publish_date <= new Date().toISOString()
    //     )
    const testimonials = await $strapi.graphql({
      query: testimonialsExtracts(),
    })
    let sectionUpdated = []
    const x = []
    if (data.homePage.sections) {
      data.homePage.sections.forEach((el: any) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
        x.forEach((e) => (e.visible = false))
      })
    }
    sectionUpdated = x
    return {
      page: data.homePage,
      articles,
      sectionUpdated,
      services: services.service.sections,
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

    servicesUpdated() {
      if (!this.services && this.services.length === 0) return
      const x = []
      this.services.forEach((el: any) => {
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
  methods: {
    updateVisibility(ind: number, t: boolean) {
      this.sectionUpdated[ind].visible = t
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
