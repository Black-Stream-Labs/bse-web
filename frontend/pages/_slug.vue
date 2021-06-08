<template>
  <div>
    <Hero
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="updatedHeaderIMage"
    ></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <div v-html="$md.render(updatedContent)" />
      </div>
      <div class="container max-w-5xl mx-auto px-4">
        <template v-for="(section, ind) in sectionUpdated">
          <div
            :key="ind"
            class="flex items-center justify-center py-10"
            :class="ind % 2 == 0 ? 'flex-row-reverse' : ''"
          >
            <div class="w-1/2 flex items-center justify-center p-4">
              <img :src="section.section_image.url" alt="" class="image" />
            </div>
            <div class="w-1/2">
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
export default Vue.extend({
  name: 'SitePageTemplate',
  components: {
    Hero,
  },
  layout: 'default',
  async asyncData({ app, params }) {
    console.log(params)
    let routeParams = params.slug
    if (!routeParams) {
      routeParams = 'home-page'
    }
    const data = await app.$strapi.$http.$get(routeParams)
    return {
      page: data || {},
    }
  },
  computed: {
    updatedContent() {
      return formatContentImageUrl(this.page.content.content)
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
      if (this.page.content.header_image) {
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
