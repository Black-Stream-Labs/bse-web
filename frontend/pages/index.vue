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
      <div
        class="container max-w-5xl mx-auto px-4 py-10"
        :class="`grid gap-4 grid-rows-${sectionUpdated.length + 1}`"
      >
        <div
          v-for="(section, ind) in sectionUpdated"
          :key="ind"
          class="row-span-1 py-10"
        >
          <div class="grid grid-cols-12">
            <div
              class="flex items-center justify-center p-4"
              :class="`col-start-${ind === 0 ? 1 : ind + 3} col-span-9`"
            >
              <img
                :src="section.section_image.url"
                alt=""
                class="image px-4"
                width="150"
                height="150"
              />
              <div
                class="px-4"
                v-html="$md.render(section.section_content)"
              ></div>
            </div>
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

export default Vue.extend({
  name: 'SitePageTemplate',
  components: {
    Hero,
  },
  layout: 'default',
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: homePageQuery() })
    return {
      page: data.homePage,
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
