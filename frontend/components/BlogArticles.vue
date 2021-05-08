<template>
  <div class="columns is-multiline is-centered is-mobile">
    <div
      v-for="article in articles"
      :key="article.id"
      class="column is-full-mobile is-one-third-tablet is-one-quarter-desktop is-align-self-stretch"
    >
      <div class="card bm--card-equal-height">
        <header v-if="article.headerImage" class="card-image pl-4 pt-4">
          <figure class="image is-64x64">
            <img class="" :src="`/api/${article.headerImage.url}`" />
          </figure>
        </header>
        <main class="card-content py-3">
          <div class="content">
            <strong>{{ article.title }} sticker. </strong>
            <br />
            {{ article.description }}
            <p
              v-if="article.blogcategories.length"
              id="category"
              class="uk-text-uppercase"
            >
              <span v-for="cat in article.blogcategories" :key="cat.id">
                {{ cat.name }}
              </span>
            </p>
          </div>
        </main>
        <footer class="card-footer">
          <NuxtLink :to="`/articles/${article.slug}`" class="card-footer-item">
            More Details
          </NuxtLink>
        </footer>
      </div>
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
