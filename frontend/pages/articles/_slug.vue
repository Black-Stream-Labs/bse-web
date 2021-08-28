<template>
  <div>
    <Hero :title="article.title" :headerimage="updatedHeaderIMage"></Hero>

    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div class="my-12">
            <div
              class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
            >
              <div class="col-span-2">
                <div class="flex justify-between items-center">
                  <span v-if="article.author" class="text-xl">
                    Written by:
                    <span class="font-bold text-2xl italic">{{
                      article.author.username
                    }}</span>
                  </span>

                  <span class="text-xs italic dark:text-gray-200">
                    Published -
                    <time
                      :datetime="
                        new Date(article.published_at).toLocaleDateString(
                          'en-GB',
                          {
                            day: 'numeric',
                            year: 'numeric',
                            month: 'short',
                          }
                        )
                      "
                    >
                      {{
                        new Date(article.published_at).toLocaleDateString(
                          'en-GB',
                          {
                            day: 'numeric',
                            year: 'numeric',
                            month: 'short',
                          }
                        )
                      }}
                    </time>
                  </span>
                </div>
                <p
                  v-if="article.article_categories.length > 0"
                  id="artcategories"
                  class="py-3"
                >
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
                <div v-html="$md.render(updatedContent)"></div>
                <p class="flex items-center justify-end italic pt-4">
                  <span class="pr-3"> More articles by </span>
                  <NuxtLink
                    :to="`/articles/authors/${article.author.username}`"
                    class="
                      py-1
                      px-5
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
                    ]"
                  >
                    {{ article.author.username }}
                  </NuxtLink>
                </p>
                <div v-if="extraArticles.length > 0" class="pt-16">
                  <hr />
                  <h3 class="text-xl2 pb-6 pt-16">
                    Other articles in the same category
                  </h3>
                  <template v-for="(art, id) in extraArticles">
                    <ArticleExtracts :key="id" :article="art"></ArticleExtracts>
                  </template>
                </div>
              </div>
              <BlogSidebar></BlogSidebar>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
import BlogSidebar from '@/components/BlogSidebar'
import ArticleExtracts from '@/components/ArticleExtracts'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
export default Vue.extend({
  name: 'SingleArticlePage',
  components: {
    Hero,
    BlogSidebar,
    ArticleExtracts,
  },
  data() {
    return {
      article: {},
      extraArticles: [],
    }
  },
  async fetch() {
    const data = await this.$strapi.find('articles', {
      slug: this.$route.params.slug,
    })
    // await $strapi.find('products', { 'categories.name': ['women', 'men'] })
    const categs = data[0].article_categories.map((el: any) => [
      'article_categories.slug',
      el.slug,
    ])
    const extras = await this.$strapi.find('articles', [...categs])
    this.article = data[0]
    this.extraArticles = extras
      .filter((el: any) => el.slug !== this.$route.params.slug)
      .sort((a: any, b: any) => a.published_at - b.published_at)
  },

  computed: {
    updatedContent() {
      if (this.article.content) {
        return formatContentImageUrl(this.article.content.content)
      } else {
        return null
      }
    },
    updatedHeaderIMage() {
      if (this.article.content && this.article.content.header_image) {
        return this.article.content.header_image.url
      } else {
        return null
      }
    },
  },
})
</script>

<style scoped></style>
