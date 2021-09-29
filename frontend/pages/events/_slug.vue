<template>
  <div>
    <Hero
      v-if="page"
      :title="page.title"
      :headerimage="updatedHeaderIMage"
    ></Hero>

    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div class="flex items-center">
            <a
              href="#"
              class="
                inline-flex
                items-center
                w-max
                px-2
                py-2
                capitalize
                border border-gray-400
                text-white
                dark:border-gray-50
              "
              aria-label="Go Back to Product Summary including the Search Terms and Filters"
              :class="
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
                  ? 'bg-gray-700'
                  : 'bg-gray-500'
              "
              @click.prevent="$router.go(-1)"
            >
              <LeftArrow></LeftArrow>
              <span class="px-4"> back to Events </span>
            </a>
          </div>
          <div class="my-12">
            <div
              class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
            >
              <div class="col-span-2">
                <div v-html="$md.render(updatedContent)"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import Hero from '@/components/hero/Hero'
import LeftArrow from '@/components/icons/LeftArrow'

export default Vue.extend({
  name: 'IndividualEventPage',
  components: {
    Hero,
    LeftArrow,
  },
  async asyncData({ $strapi, params }) {
    const page = await $strapi.find('single-events', { slug: params.slug })
    return { page: page[0] }
  },
  computed: {
    updatedContent() {
      if (this.page.description) {
        return formatContentImageUrl(this.page.description)
      } else {
        return null
      }
    },
    updatedHeaderIMage() {
      if (this.page.header_image) {
        return this.page.header_image.url
      } else {
        return null
      }
    },
  },
})
</script>

<style scoped></style>
