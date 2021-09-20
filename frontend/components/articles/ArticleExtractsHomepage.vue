<template>
  <article
    class="
      md:flex
      hover:text-white
      border border-gray-800
      shadow-lg
      w-full
      overflow-hidden
      h-full
      flex
      transition
      duration-500
      ease-in-out
      transform-gpu
      hover:translate-x-1 hover:translate-y-1 hover:scale-105
    "
    :class="
      $store.state.fullColor
        ? $store.state.fullColor.name === 'tgreen'
          ? 'hover:bg-tgreen '
          : $store.state.fullColor.name === 'tpurple'
          ? 'hover:bg-tpurple'
          : $store.state.fullColor.name === 'tblue'
          ? 'hover:bg-tblue'
          : $store.state.fullColor.name === 'tbrown'
          ? 'hover:bg-tbrown'
          : ''
        : $colorMode.preference === 'dark'
        ? 'hover:bg-gray-700'
        : 'hover:bg-gray-500'
    "
  >
    <div class="px-4 py-4 w-full flex flex-col">
      <h3 class="font-semibold mt-4 text-lg dark:text-gray-50">
        {{ article.title }}
      </h3>
      <p>
        <span class="text-xs italic dark:text-gray-200">
          Published -
          <time
            :datetime="
              new Date(article.published_at).toLocaleDateString('en-GB', {
                day: 'numeric',
                year: 'numeric',
                month: 'short',
              })
            "
          >
            {{
              new Date(article.published_at).toLocaleDateString('en-GB', {
                day: 'numeric',
                year: 'numeric',
                month: 'short',
              })
            }}
          </time>
        </span>
      </p>
      <div class="mb-4 w-full dark:text-gray-100">
        <div class="line-clamp-5" v-html="$md.render(updatedArticleText)"></div>
      </div>

      <div class="flex justify-between align-center flex-grow-1">
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
                :class="
                  $store.state.fullColor
                    ? 'text-gray-800 hover:text-gray-700'
                    : ''
                "
              >
                {{ cat.category }}
              </span>
            </span>
          </p>
        </div>
        <div class="w-1/4 flex flex-col align-items-end justify-end">
          <!-- <span class="text-right py-2 text-xs uppercase"> -->
          <NuxtLink
            :to="`/articles/${article.slug}`"
            class="text-right py-2 text-xs uppercase my-2 flex"
          >
            Read More <span>&rarr;</span>
          </NuxtLink>
          <!-- </span> -->
        </div>
      </div>
    </div>
  </article>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import imageUrlManipulation, {
  formatContentImageUrl,
} from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'ArticleExtractsHomepage',
  mixins: [imageUrlManipulation],
  props: {
    article: {
      type: Object,
      default: () => {},
    },
  },
  computed: {
    updatedArticleText() {
      if (this.article.description) {
        return formatContentImageUrl(this.article.description)
      } else {
        return formatContentImageUrl(this.article.content.content)
      }
    },
  },
  fetchOnServer: true,
  fetchKey: 'article-extract',
})
</script>

<style scoped></style>
