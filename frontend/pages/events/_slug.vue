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
export default Vue.extend({
  name: 'IndividualEventPage',
  components: {
    Hero,
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
