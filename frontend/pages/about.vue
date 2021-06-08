<template>
  <div>
    <Hero
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="page.content.header_image.url"
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
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import Hero from '@/components/Hero'

export default Vue.extend({
  name: 'AboutUsPage',
  components: {
    Hero,
  },
  layout: 'DefaultLayout',
  async asyncData({ $strapi }) {
    const page = await $strapi.$http.$get('about')
    return { page }
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
