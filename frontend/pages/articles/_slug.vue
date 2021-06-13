<template>
  <div>
    <Hero :title="article.title" :headerimage="updatedHeaderIMage"></Hero>

    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div v-html="$md.render(updatedContent)"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
export default Vue.extend({
  name: 'SingleArticlePage',
  components: {
    Hero,
  },
  data() {
    return {
      article: {},
    }
  },
  async fetch() {
    const data = await this.$strapi.find('articles', {
      slug: this.$route.params.slug,
    })

    this.article = data[0]
  },

  computed: {
    updatedContent() {
      if (this.article.content) {
        return formatContentImageUrl(this.article.content.content)
      } else {
        return null
      }
    },
    updatedHeaderIMage() {
      if (this.article.content && this.article.content.header_image) {
        return this.article.content.header_image.url
      } else {
        return null
      }
    },
  },
})
</script>

<style scoped></style>
