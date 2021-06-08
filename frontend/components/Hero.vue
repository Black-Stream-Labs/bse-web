<template>
  <section class="py-20 custom-background bg-gray-100 text-gray-800 border-b-2">
    <div class="container mx-auto">
      <div class="px-10 md:block">
        <div class="pb-8 mt-auto">
          <div class="max-w-5xl mx-auto flex justify-between items-center">
            <div class="title w-2/5">
              <h1 class="text-2xl md:text-3xl mb-8 mt-16 font-serif">
                {{ title }}
              </h1>

              <p v-if="subtitle" class="text-gray-800">
                {{ subtitle }}
              </p>
            </div>

            <div v-if="headerimage" class="mb-6 mt-12 w-3/5 hidden md:block">
              <img :src="$getStrapiMedia(headerimage)" alt="header image" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'
export default Vue.extend({
  mixins: [imageUrlManipulation],
  props: {
    title: {
      type: String,
      default: '',
    } as PropOptions,
    subtitle: {
      type: String,
      default: '',
    } as PropOptions,
    headerimage: {
      type: [String, null],
      default: null,
    } as PropOptions,
  },

  data() {
    return {
      isOpen: false,
    }
  },
})
</script>

<style scoped></style>
