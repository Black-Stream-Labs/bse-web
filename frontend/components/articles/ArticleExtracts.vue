<template>
  <article
    class="
      rounded
      border
      hover:border-gray-600
      shadow
      w-full
      overflow-hidden
      md:flex
      my-2
      duration-500
      ease-in-out
      transform
      hover:scale-105
    "
    @mouseenter="transitionButton = true"
    @mouseleave="transitionButton = false"
  >
    <div
      v-if="article.content && article.content.header_image"
      class="md:w-1/4"
    >
      <NuxtLink :to="`/articles/${article.slug}`" class="dark:text-gray-50">
        <img
          loading="lazy"
          class="w-full h-full object-cover"
          :src="article.content.header_image.url"
          :alt="`${article.content.title} image`"
        />
      </NuxtLink>
    </div>

    <div
      class="px-4 py-4 w-full"
      :class="
        article.content &&
        article.content.header_image &&
        article.content.header_image.url
          ? 'md:w-3/4 max-w-full'
          : ''
      "
    >
      <h3
        class="
          font-semibold
          text-gray-800
          mt-4
          hover:underline
          text-lg
          dark:text-gray-50
        "
      >
        <NuxtLink :to="`/articles/${article.slug}`">
          {{ article.title }}
        </NuxtLink>
      </h3>
      <p>
        <span class="text-xs text-gray-500 italic dark:text-gray-200">
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
      <div class="mb-4 w-full text-gray-700 dark:text-gray-100">
        <div class="line-clamp-5" v-html="$md.render(updatedArticleText)"></div>
      </div>

      <div class="flex justify-between align-center">
        <p v-if="article.article_categories.length > 0" id="categories">
          <span class="text-xs">
            Categories:
            <NuxtLink
              v-for="cat in article.article_categories"
              :key="cat.id"
              :to="`/articles/categories/${cat.slug}`"
              class="
                capitalize
                text-gray-500
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
            </NuxtLink>
          </span>
        </p>
        <div class="flex flex-col align-end justify-end">
          <NuxtLink
            :to="`/articles/${article.slug}`"
            class="
              py-2
              px-4
              text-center
              flex
              items-center
              justify-end
              border border-gray-50
              text-white
              dark:border-gray-50
              duration-300
              transform-gpu
              transition-all
            "
            :class="[
              $store.state.fullColor
                ? $store.state.fullColor.name === 'tgreen'
                  ? 'bg-tgreen '
                  : $store.state.fullColor.name === 'tpurple'
                  ? 'bg-tpurple'
                  : $store.state.fullColor.name === 'tblue'
                  ? 'bg-tblue'
                  : $store.state.fullColor.name === 'tbrown'
                  ? 'bg-tbrown'
                  : ''
                : $colorMode.preference === 'dark'
                ? 'hover:bg-gray-700'
                : 'hover:bg-gray-500',
              transitionButton ? 'scale-105 transition-all ' : '',
            ]"
          >
            Read More
            <RightArrow></RightArrow>
          </NuxtLink>
        </div>
      </div>
    </div>
  </article>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'

import RightArrow from '@/components/icons/RightArrow'
export default Vue.extend({
  name: 'ArticleExtracts',
  components: {
    RightArrow,
  },
  mixins: [imageUrlManipulation],
  props: {
    article: {
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {
      transitionButton: false,
    }
  },
  computed: {
    updatedArticleText() {
      if (this.article.description) {
        return this.article.description
      } else {
        return this.article.content.content
      }
    },
  },
  fetchOnServer: true,
  fetchKey: 'article-extract',
})
</script>

<style scoped></style>
