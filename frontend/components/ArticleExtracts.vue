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
  >
    <div
      v-if="article.content && article.content.header_image"
      class="md:w-1/4"
    >
      <NuxtLink :to="`/articles/${article.slug}`" class="dark:text-gray-50">
        <img
          class="w-full h-full object-cover"
          :src="$getStrapiMedia(article.content.header_image.url)"
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
          {{
            new Date(article.published_at).toLocaleDateString('en-GB', {
              day: 'numeric',
              year: 'numeric',
              month: 'short',
            })
          }}
        </span>
      </p>
      <div
        v-if="article.description"
        class="mb-4 w-full text-gray-700 dark:text-gray-100"
      >
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
        </div>
        <div class="w-1/4 flex flex-col align-end justify-end">
          <NuxtLink
            :to="`/articles/${article.slug}`"
            class="
              text-right
              py-2
              text-indigo-600 text-xs
              uppercase
              hover:underline
            "
          >
            Read More <span>&rarr;</span>
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

export default Vue.extend({
  name: 'ArticleExtracts',
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
