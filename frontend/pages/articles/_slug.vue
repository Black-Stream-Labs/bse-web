<template>
  <div class="flex">
    <div class="w-full">
      <ol class="flex text-gray-700 bg-gray-300 rounded py-2 px-2">
        <li class="px-2"><a href="#" class="hover:underline">Home</a></li>
        <li class="text-gray-500 select-none">/</li>
        <li class="px-2"><a href="#" class="hover:underline">Series</a></li>
        <li class="text-gray-500 select-none">/</li>
        <li class="px-2 text-indigo-600">Game of thrones</li>
      </ol>

      <br />
      <br />
    </div>

    <!-- <Hero :title="article.title"></Hero>
    <BlogCategories></BlogCategories>
    <article class="column is-12">
      <div
        v-if="article.article_content"
        id="editor"
        v-html="$md.render(article.article_content.content)"
      ></div>
      <div v-if="article.content" id="editor">{{ article.content }}</div>
      <p v-if="article.published_at">
        {{ new Date(article.published_at).toLocaleString() }}
      </p>
    </article> -->
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
// import Hero from '@/components/Hero'
// import BlogCategories from '@/components/BlogCategories'
import articleQuery from '~/apollo/queries/blog/article'

export default Vue.extend({
  name: 'SingleArticlePage',
  components: {
    // BlogCategories,
    // Hero,
  },
  data() {
    return {
      // article: {},
    }
  },
  apollo: {
    article: {
      prefetch: false,
      query: articleQuery,
      variables() {
        return { slug: this.$route.params.slug.toLowerCase() }
      },
    },
  },
})
</script>

<style scoped></style>
