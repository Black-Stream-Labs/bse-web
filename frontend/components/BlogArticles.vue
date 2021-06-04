<template>
  <div class="mx-auto my-12 px-4">
    <div class="md:flex justify-between items-center mb-8">
      <div>
        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">
          Recent Articles:
        </h2>

        <p class="text-gray-700">
          Discover tutorials and news about algo-trading specifically written
          for quants.
        </p>
      </div>

      <div class="mt-2">
        <a
          href="/blog"
          class="py-2 text-indigo-600 text-sm hover:underline mt-4"
        >
          Browse All <span>&rarr;</span>
        </a>
      </div>
    </div>
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <article
        v-for="article in articles"
        :key="article.id"
        class="rounded border md:shadow w-full overflow-hidden"
      >
        <header>
          <a href="#">
            <img
              v-if="article.header_image"
              class="w-full h-48 object-cover"
              :src="`/api/${article.header_image.url}`"
              :alt="`${article.title} image`"
            />
          </a>
        </header>

        <main class="px-4 py-4">
          <div class="text-xs text-gray-600 font-medium">
            <a href="#" class="uppercase hover:underline"> recipe </a>
            <span class="mx-1">&bull;</span>
            <span>{{ article.published_at }}</span>
          </div>

          <h3 class="font-semibold text-gray-800 my-4 hover:underline text-lg">
            <a href="#"> {{ article.title }} </a>
          </h3>

          <div class="text-gray-700">
            {{ article.description }}
          </div>
          <p
            v-if="article.article_categories.length"
            id="category"
            class="uk-text-uppercase"
          >
            <span v-for="cat in article.article_categories" :key="cat.id">
              {{ cat.category }}
            </span>
          </p>
        </main>
        <footer class="mt-4">
          <NuxtLink
            :to="`/articles/${article.slug}`"
            class="py-2 text-indigo-600 text-xs uppercase hover:underline"
            >Read More <span>&rarr;</span></NuxtLink
          >
        </footer>
      </article>
    </div>
  </div>
</template>

<script lang="ts">
//  @ts-nocheck
import Vue from 'vue'

export default Vue.extend({
  name: 'BlogArticles',
  props: {
    articles: { type: Array, default: () => [] },
  },

  data() {
    return {}
  },
  computed: {
    // articlesToDisplay() {
    //   const art = this.articles
    //   return art.splice(0, 5)
    // },
    // leftArticles() {
    //   return this.articles.slice(0, this.leftArticlesCount)
    // },
    // rightArticles() {
    //   return this.articles.slice(this.leftArticlesCount, this.articles.length)
    // },
  },
})
</script>

<style scoped></style>
