<template>
  <main class="main-container">
    <Hero
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="parsedHeaderImage"
    ></Hero>
    <section class="container max-w-5xl mx-auto">
      <div v-html="$md.render(updatedContent)" />
    </section>
    <section v-if="page.sections" class="container max-w-5xl mx-auto">
      <template v-for="(section, ind) in sectionUpdated">
        <div
          :key="ind"
          class="flex items-center justify-center py-10"
          :class="ind % 2 == 0 ? 'flex-row-reverse' : ''"
        >
          <div class="w-1/3">
            <img :src="section.section_image.url" alt="" class="image" />
          </div>
          <div class="w-2/3 px-2">
            <div v-html="$md.render(section.section_content)"></div>
          </div>
        </div>
      </template>
    </section>
  </main>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'SafeguardingPage',
  components: {
    Hero,
  },
  layout: 'default',
  async asyncData({ app }) {
    const data = await app.$strapi.$http.$get('safeguarding')
    return {
      page: data || {},
    }
  },
  computed: {
    updatedContent() {
      return formatContentImageUrl(this.page.content.content)
    },
    parsedHeaderImage() {
      if (this.page.header_image) {
        return this.page.header_image.url
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
  },
})
</script>

<style scoped></style>
