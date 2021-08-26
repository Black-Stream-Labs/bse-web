<template>
  <div class="py-10">
    <div class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4">
      <main class="col-span-2">
        <div
          v-for="(author, ind) in authors"
          :key="ind"
          class="flex flex-col items-center justify-center"
        >
          <div class="w-full">
            Author:
            <NuxtLink :to="`/articles/authors/${author.username}`">
              <b>{{ author.username }}</b>
            </NuxtLink>
          </div>
          <article
            v-for="art in author.articles"
            :key="art.id"
            class="
              rounded
              border
              hover:border-gray-600
              shadow-lg
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
                class="
                  font-semibold
                  text-gray-800
                  dark:text-gray-100
                  mt-4
                  hover:underline
                  text-lg
                "
              >
                <NuxtLink :to="`/articles/${art.slug}`">
                  {{ art.title }}
                </NuxtLink>
              </h3>
              <p>
                <span class="text-xs text-gray-500 italic dark:text-gray-100">
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
              <div
                v-if="art.description"
                class="mb-4 w-full text-gray-700 dark:text-gray-100"
              >
                <div
                  class="line-clamp-5"
                  v-html="$md.render(art.description)"
                ></div>
              </div>

              <div class="flex justify-between align-center">
                <div class="w-3/4">
                  <p v-if="art.article_categories.length > 0" id="categories">
                    <span class="text-xs">
                      Categories:
                      <NuxtLink
                        v-for="cat in art.article_categories"
                        :key="cat.id"
                        :to="`/articles/categories/${cat.slug}`"
                        class="
                          capitalize
                          text-gray-500
                          dark:text-gray-100 dark:bg-gray-600
                          font-light
                          rounded
                          bg-gray-200
                          px-2
                          py-1
                          mx-1
                        "
                      >
                        {{ cat.category }}
                      </NuxtLink>
                    </span>
                  </p>
                </div>
                <div class="w-1/4 flex flex-col align-end justify-end">
                  <NuxtLink
                    :to="`/articles/${art.slug}`"
                    class="
                      text-right
                      py-2
                      text-blue-600 text-xs
                      dark:text-gray-100
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
        </div>
      </main>
      <BlogSidebar></BlogSidebar>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck

// eslint-disable-next-line import/named
import Vue from 'vue'
import BlogSidebar from '@/components/BlogSidebar'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'
export default Vue.extend({
  name: 'AuthorExtracts',
  components: { BlogSidebar },
  mixins: [imageUrlManipulation],
  props: {
    authors: { type: Array, default: () => [] },
  },
  data() {
    return {}
  },
  mounted() {},
})
</script>

<style scoped></style>
