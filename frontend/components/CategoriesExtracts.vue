<template>
  <div class="py-10">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <main class="col-span-2">
        <div
          v-for="(category, ind) in categExtracts"
          :key="ind"
          class="flex flex-col items-center justify-center"
        >
          <div class="w-full">
            Category:
            <NuxtLink :to="`/articles/categories/${category.slug}`">
              <b>
                {{ category.category }} ({{ category.articles.length }}
                articles)
              </b>
            </NuxtLink>
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
            "
          >
            <div
              v-if="art.content && art.content.header_image"
              class="md:w-1/4"
            >
              <NuxtLink :to="`/articles/${art.slug}`">
                <img
                  class="w-full h-full object-cover"
                  :src="$getStrapiMedia(art.content.header_image.url)"
                  :alt="`${art.content.title} image`"
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
                  {{
                    new Date(art.published_at).toLocaleDateString('en-GB', {
                      day: 'numeric',
                      year: 'numeric',
                      month: 'short',
                    })
                  }}
                </span>
              </p>
              <div v-if="art.description" class="mb-4 w-full text-gray-700">
                <div
                  class="line-clamp-5"
                  v-html="$md.render(art.description)"
                ></div>
              </div>

              <div class="flex flex-col align-end justify-end">
                <NuxtLink
                  :to="`/articles/${art.slug}`"
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
          </article>
        </div>
      </main>
      <BlogSidebar></BlogSidebar>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck

import Vue, { PropOptions } from 'vue'
import BlogSidebar from '@/components/BlogSidebar'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'
import { categsExtra } from '@/apollo/queries/blog/categsExtra.js'
export default Vue.extend({
  name: 'CategoriesExtracts',
  components: { BlogSidebar },
  mixins: [imageUrlManipulation],
  props: {
    categories: { type: Array, default: () => [] } as PropOptions,
  },
  data() {
    return {
      categExtracts: [],
    }
  },
  async fetch() {
    const data = await this.$strapi.graphql({
      query: categsExtra(),
    })
    this.categExtracts = data.articleCategories
  },
  mounted() {},
  fetchOnServer: true,
  fetchKey: 'article-categories',
})
</script>

<style scoped></style>
