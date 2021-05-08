<template>
  <div class="columns is-mobile">
    <article class="column is-12">
      <div
        v-if="article.content"
        id="editor"
        v-html="$md.render(article.content)"
      ></div>
      <!-- <div v-if="article.content" id="editor">{{ article.content }}</div> -->
      <p v-if="article.published_at">
        {{ new Date(article.published_at).toLocaleString() }}
      </p>
    </article>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import articleQuery from '~/apollo/queries/blog/article'

export default Vue.extend({
  name: 'ArticlePage',
  layout: 'article',
  data() {
    return {
      article: {},
    }
  },
  async fetch() {
    const { data } = await this.$apolloProvider.defaultClient.query({
      query: articleQuery,
      variables: {
        slug: this.$route.params.slug.toLowerCase(),
      },
    })
    this.article = data.articles[0]
  },
})
</script>

<style scoped></style>
