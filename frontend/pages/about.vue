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
      <div class="container max-w-5xl mx-auto p-4">
        <h2 class="capitalize text-2xl dark:text-white">Why we do things</h2>
        <template v-for="(section, ind) in sectionUpdated">
          <div :key="ind" class="flex flex-row py-8">
            <!-- <div
            :key="ind"
            class="flex items-center justify-center py-10"
            :class="ind % 2 == 0 ? 'flex-row-reverse' : ''"
          > -->
            <img
              :src="section.section_image.url"
              :alt="section.section_title"
              class="image"
              width="80"
            />
            <div class="w-3/4 pl-4">
              <h3 class="capitalize text-xl mb-3">
                {{ section.section_title }}
              </h3>
              <div v-html="$md.render(section.section_content)"></div>
            </div>
          </div>
        </template>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { aboutQuery } from '@/apollo/queries/pages/about.js'

export default Vue.extend({
  name: 'AboutPage',
  components: {
    Hero,
  },
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: aboutQuery() })
    return {
      page: data.about,
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
