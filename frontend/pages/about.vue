<template>
  <div>
    <Hero
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="page.header_image.url"
      size="is-medium"
    ></Hero>
    <section class="section py-20 px-4">
      <div class="container max-w-5xl mx-auto">
        <!--  eslint-disable-next-line vue/no-v-html -->
        <div v-html="$md.render(updatedContent)" />
      </div>
      <div class="container max-w-5xl mx-auto">
        <template v-for="(section, ind) in sectionUpdated">
          <div :key="ind" class="flex items-center justify-center py-10">
            <div class="" :class="ind % 2 == 0 ? 'flex-row-reverse' : ''">
              <img
                :src="section.section_image.url"
                alt=""
                width="300"
                class="image"
              />
            </div>
            <div class="" :class="ind % 2 == 0 ? 'flex-row-reverse' : ''">
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
      return formatContentImageUrl(this.page.content)
    },
    sectionUpdated() {
      if (!this.page.HomepageSections) return
      const x = []
      this.page.HomepageSections.forEach((el) => {
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
