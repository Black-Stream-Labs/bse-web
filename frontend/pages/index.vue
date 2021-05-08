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
  },
})
</script>
