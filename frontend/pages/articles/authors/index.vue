<template>
  <div>
    <Hero title="Our Authors"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <AuthorExtracts :authors="authors"></AuthorExtracts>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'
import AuthorExtracts from '@/components/articles/AuthorExtracts'
import Hero from '@/components/hero/Hero'
import { authors } from '@/apollo/queries/blog/authors.js'
export default Vue.extend({
  name: 'AllAuthorsPage',
  components: {
    AuthorExtracts,
    Hero,
  },
  async asyncData({ app }) {
    const data = await app.$strapi.graphql({
      query: authors(),
    })
    const date = new Date()
    const extra = data.users.map((el: any) => {
      const arts = el
      arts.articles = arts.articles.filter(
        (a: any) =>
          (a.future_publish_date === null && a.unpublish_date === null) ||
          (a.future_publish_date < date.toISOString() &&
            a.unpublish_date === null) ||
          (a.future_publish_date === null &&
            a.unpublish_date > date.toISOString()) ||
          (a.future_publish_date < date.toISOString() &&
            a.unpublish_date > date.toISOString())
      )
      return arts
    })
    return {
      authors: extra.flat(1),
    }
  },
})
</script>

<style scoped></style>
