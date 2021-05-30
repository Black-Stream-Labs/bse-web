<template>
  <main class="main-container">
    <Hero
      :title="page.title"
      :subtitle="page.content.subtitle"
      :headerimage="page.content.header_image.url"
      size="is-medium"
    ></Hero>
    <div class="section">
      <div class="container">
        <!--  eslint-disable-next-line vue/no-v-html -->
        <div class="content" v-html="$md.render(updatedContent)" />
      </div>
      <div class="container">
        <div class="columns is-multiline is-centered">
          <div
            v-for="(section, ind) in sectionUpdated"
            :key="ind"
            class="column is-12 is-12-tablet is-12-desktop is-12-fullhd is-12-widescreen"
          >
            <div class="columns is-multiline is-centered">
              <div
                class="column is-6"
                :class="ind % 2 == 0 ? 'is-reversed' : ''"
              >
                <img
                  :src="section.section_image.url"
                  alt=""
                  width="300"
                  class="image"
                />
              </div>
              <div
                class="column is-6"
                :class="ind % 2 == 0 ? 'is-reversed' : ''"
              >
                <div
                  class="content"
                  v-html="$md.render(section.section_content)"
                ></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
export default Vue.extend({
  name: 'MainPage',
  components: {
    Hero,
  },
  layout: 'default',
  async asyncData({ $strapi, route }) {
    const routeName = route.name === 'index' ? 'home-page' : route.params.slug
    const data = await $strapi.$http.$get(routeName)

    return {
      page: data,
    }
  },
  computed: {
    updatedContent() {
      return formatContentImageUrl(this.page.content.content)
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
<style scoped>
.column &.is-reversed &:nth-child(odd) {
  order: 2;
}
.column &.is-reversed &:nth-child(even) {
  order: 1;
}
</style>
