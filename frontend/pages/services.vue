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
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1">
          <main class="col-span-2 px-4">
            <section
              v-for="(section, ind) in sectionUpdated"
              :id="`${$slugify(section.section_title)}-${ind}`"
              :key="ind"
              class="flex flex-col md:flex-row items-start py-8"
            >
              <img
                :src="section.section_image.url"
                :alt="section.section_title"
                class="image"
                width="80"
                height="80"
                loading="lazy"
              />
              <div class="md:pl-4 pt-4">
                <h3 class="capitalize text-xl mb-3">
                  {{ section.section_title }}
                </h3>
                <div v-html="$md.render(section.section_content)"></div>
              </div>
            </section>
          </main>
          <aside
            class="
              hidden
              col-span-1
              md:flex
              flex-col
              justify-between
              py-10
              pl-8
            "
          >
            <div class="group outline-none sticky top-24 text-justify">
              <a
                v-for="(section, ind) in sectionUpdated"
                :key="`sidebar-${ind}`"
                v-smooth-scroll="{ offset: -100 }"
                class="
                  group
                  text-center
                  border border-gray-700
                  dark:border-blue-100
                  text-white
                  flex
                  justify-end
                  px-4
                  py-3
                  items-center
                  ease
                "
                :class="$store.state.fullColor ? 'text-white' : ''"
                :style="
                  $store.state.fullColor
                    ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
                    : ''
                "
                :href="`#${$slugify(section.section_title)}-${ind}`"
              >
                {{ section.section_title }}
              </a>
              <div class="hidden sm:flex sm:flex-col items-start justify-start">
                <LogoNotextCircle
                  class="w-full"
                  height="300"
                  :color="
                    $store.state.fullColor ? 'var(--background-end)' : 'white'
                  "
                ></LogoNotextCircle>
              </div>
            </div>
          </aside>
        </div>
      </div>
    </section>

    <section
      id="whattheysay"
      class="section"
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
          : ''
      "
    >
      <div class="container max-w-5xl mx-auto px-4 py-10 text-center">
        <h2 class="text-white">What they say</h2>
        <TestimonialsComp
          :testimonials="updatedTestimonials"
        ></TestimonialsComp>
      </div>
    </section>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4 py-24 dark:text-white">
        <h2 v-if="page.content.subtitle" class="capitalize text-2xl">
          {{ page.content.subtitle }}
        </h2>
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>
    <section
      v-if="updatedExtraContent"
      class="section"
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
          : ''
      "
    >
      <div
        class="container max-w-3xl mx-auto px-4 py-10 text-center"
        :class="$store.state.fullColor ? 'text-white' : ''"
      >
        <div v-html="$md.render(updatedExtraContent)"></div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import LogoNotextCircle from '@/components/icons/LogoNotextCircle'
import TestimonialsComp from '@/components/testimonials/TestimonialsComp'
import slugify from '@/mixins/slugify.js'
import { testimonialsExtracts } from '@/apollo/queries/testimonials/testimonialsExtracts.js'

import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { servicesQuery } from '@/apollo/queries/pages/services.js'
export default Vue.extend({
  name: 'ServicesPage',
  components: {
    Hero,
    LogoNotextCircle,
    TestimonialsComp,
  },
  mixins: [slugify],
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: servicesQuery() })
    const testimonials = await $strapi.graphql({
      query: testimonialsExtracts(),
    })
    return {
      page: data.service,
      testimonials: testimonials.testimonials,
    }
  },
  computed: {
    updatedExtraContent() {
      if (this.page.extraContent) {
        return formatContentImageUrl(this.page.extraContent)
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
    updatedContent() {
      if (this.page.content) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return {}
      }
    },
    sectionUpdated() {
      if (!this.page.sections) return
      const x = []
      this.page.sections.forEach((el) => {
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
  mounted() {
    this.$nextTick(() => {
      setTimeout(() => {
        this.scrollToElement(location.hash.split('#')[1])
      }, 150)
    })
  },
  methods: {
    scrollToElement(ele: string) {
      const el = document.getElementById(ele)
      if (ele) {
        const header = document.getElementsByTagName('header')[0].offsetHeight
        const headerHeight = el.offsetTop - header
        return window.scrollTo({
          top: headerHeight,
          behavior: 'smooth',
        })
      }
    },
  },
})
</script>

<style scoped lang="postcss"></style>
