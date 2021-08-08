<template>
  <NuxtLink :to="`/articles/${article.slug}`" class="my-2">
    <article
      class="
        md:flex
        hover:text-white
        border border-gray-800
        shadow
        w-full
        overflow-hidden
      "
      :class="
        $store.state.fullColor
          ? `hover:bg-${$store.state.fullColor.name} hover:border-${$store.state.fullColor.name}`
          : ''
      "
    >
      <div class="px-4 py-4 w-full">
        <h3 class="font-semibold mt-4 text-lg dark:text-gray-50">
          {{ article.title }}
        </h3>
        <p>
          <span class="text-xs italic dark:text-gray-200">
            Published -
            {{
              new Date(article.published_at).toLocaleDateString('en-GB', {
                day: 'numeric',
                year: 'numeric',
                month: 'short',
              })
            }}
          </span>
        </p>
        <div v-if="article.description" class="mb-4 w-full dark:text-gray-100">
          <div
            class="line-clamp-5"
            v-html="$md.render(article.description)"
          ></div>
        </div>

        <div class="flex justify-between align-center">
          <div class="w-3/4">
            <p v-if="article.article_categories.length > 0" id="categories">
              <span class="text-xs">
                Categories:
                <span
                  v-for="cat in article.article_categories"
                  :key="cat.id"
                  class="
                    capitalize
                    font-light
                    rounded
                    bg-gray-200
                    px-2
                    py-1
                    mx-1
                    dark:bg-gray-700 dark:text-gray-300
                  "
                >
                  {{ cat.category }}
                </span>
              </span>
            </p>
          </div>
          <div class="w-1/4 flex flex-col align-end justify-end">
            <span class="text-right py-2 text-xs uppercase">
              Read More <span>&rarr;</span>
            </span>
          </div>
        </div>
      </div>
    </article>
  </NuxtLink>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'ArticleExtractsHomepage',
  mixins: [imageUrlManipulation],
  props: {
    article: {
      type: Object,
      default: () => {},
    },
  },
  fetchOnServer: true,
  fetchKey: 'article-extract',
})
</script>

<style scoped></style>
