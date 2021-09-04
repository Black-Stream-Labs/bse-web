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
        <div class="grid grid-cols-12 gap-4">
          <div class="col-span-12 sm:col-span-8">
            <div
              v-for="(section, ind) in sectionUpdated"
              :key="ind"
              class="flex flex-row items-start py-8"
            >
              <img
                :src="section.section_image.url"
                :alt="section.section_title"
                class="image"
                width="80"
                height="80"
                loading="lazy"
              />
              <div class="pl-4">
                <h3 class="capitalize text-xl mb-3">
                  {{ section.section_title }}
                </h3>
                <div v-html="$md.render(section.section_content)"></div>
              </div>
            </div>
          </div>
          <div
            class="
              hidden
              sm:flex sm:flex-row
              items-end
              justify-end
              sm:col-span-4
            "
          >
            <LogoImage
              width="600"
              height="600"
              :color="
                $store.state.fullColor ? 'var(--background-end)' : 'white'
              "
            ></LogoImage>
          </div>
        </div>
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
        <h2 v-if="page.content.subtitle" class="capitalize text-2xl">
          {{ page.content.subtitle }}
        </h2>
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <div v-html="$md.render(updatedExtraContent)"></div>
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
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2 class="text-white">What they say</h2>

        <TestimonialsComp
          :testimonials="updatedTestimonials"
        ></TestimonialsComp>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import LogoImage from '@/components/icons/LogoImage'
import TestimonialsComp from '@/components/testimonials/TestimonialsComp'

import { testimonialsExtracts } from '@/apollo/queries/testimonials/testimonialsExtracts.js'

import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { servicesQuery } from '@/apollo/queries/pages/services.js'
export default Vue.extend({
  name: 'ServicesPage',
  components: {
    Hero,
    LogoImage,
    TestimonialsComp,
  },
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
})
</script>

<style scoped lang="postcss"></style>
