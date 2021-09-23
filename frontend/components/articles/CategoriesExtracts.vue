<template>
  <div class="py-10">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <main class="col-span-2">
        <div
          v-for="(category, ind) in updatedCategsExtracts"
          :key="ind"
          class="flex flex-col items-center justify-center"
        >
          <div class="w-full">
            <h2 class="text-2xl pb-4">
              <span class="pr-2"> Article Category: </span>
              <NuxtLink :to="`/articles/categories/${category.slug}`">
                <span class="italic capitalize font-bold">
                  {{ category.category }} ({{ category.articles.length }}
                  articles)
                </span>
              </NuxtLink>
            </h2>
          </div>
          <article
            v-for="art in category.articles"
            :key="art.id"
            class="
              rounded
              border
              hover:border-gray-600
              shadow
              w-full
              overflow-hidden
              md:flex
              my-2
              transition
              duration-500
              ease-in-out
              transform
              hover:scale-105
            "
          >
            <div
              v-if="art.content && art.content.header_image"
              class="md:w-1/4"
            >
              <NuxtLink :to="`/articles/${art.slug}`">
                <img
                  loading="lazy"
                  class="w-full h-full object-cover"
                  :src="art.content.header_image.url"
                  :alt="`${art.title} image`"
                />
              </NuxtLink>
            </div>

            <div
              class="px-4 py-4 w-full"
              :class="
                art.content &&
                art.content.header_image &&
                art.content.header_image.url
                  ? 'md:w-3/4 max-w-full'
                  : ''
              "
            >
              <h3
                class="font-semibold text-gray-800 mt-4 hover:underline text-lg"
              >
                <NuxtLink :to="`/articles/${art.slug}`">
                  {{ art.title }}
                </NuxtLink>
              </h3>
              <p>
                <span class="text-xs text-gray-500 italic">
                  Published -
                  <time
                    :datetime="
                      new Date(art.published_at).toLocaleDateString('en-GB', {
                        day: 'numeric',
                        year: 'numeric',
                        month: 'short',
                      })
                    "
                  >
                    {{
                      new Date(art.published_at).toLocaleDateString('en-GB', {
                        day: 'numeric',
                        year: 'numeric',
                        month: 'short',
                      })
                    }}
                  </time>
                </span>
              </p>
              <div v-if="art.description" class="mb-4 w-full text-gray-700">
                <div
                  class="line-clamp-5"
                  v-html="$md.render(art.description)"
                ></div>
              </div>

              <div class="flex align-end justify-end">
                <NuxtLink
                  :to="`/articles/${art.slug}`"
                  class="
                    py-2
                    px-4
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
          </article>
          <hr
            v-if="ind < updatedCategsExtracts.length - 1"
            class="w-full my-5"
          />
        </div>
      </main>
      <BlogSidebar></BlogSidebar>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck

import Vue from 'vue'
import BlogSidebar from '@/components/articles/BlogSidebar'
import RightArrow from '@/components/icons/RightArrow'

import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
export default Vue.extend({
  name: 'CategoriesExtracts',
  components: { BlogSidebar, RightArrow },
  props: {
    categories: { type: Array, default: () => [] },
  },
  data() {
    return {
      transitionButton: false,
    }
  },
  computed: {
    updatedCategsExtracts() {
      const x = []
      this.categories.forEach((el: any) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },
  },
  fetchOnServer: true,
  fetchKey: 'article-categories',
})
</script>

<style scoped></style>
