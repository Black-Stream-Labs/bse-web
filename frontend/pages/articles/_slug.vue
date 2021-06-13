<template>
  <div>
    <Hero title="Fisrt titt"></Hero>
    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <!-- <div v-if="updatedContent" class="page-content pb-10">
          <div v-html="$md.render(updatedContent)"></div>
        </div> -->
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
// import { singleArticle } from '@/apollo/queries/blog/singleArticle.js'
import singleArticle from '@/apollo/queries/blog/singleArticle.gql'

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
    const data = await this.$apolloProvider.defaultClient.query({
      query: singleArticle,
      variables() {
        return { slug: this.$route.params.slug }
      },
    })
    console.log(data)
    this.article = data
  },
  // apollo: {
  //   article: {
  //     query: singleArticle,
  //     prefetch: true,
  //     variables() {
  //       return { slug: this.$route.params.slug }
  //     },
  //   },
  // },

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
