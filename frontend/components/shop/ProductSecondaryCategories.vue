<template>
  <div class="grid gap-4 grid-cols-12">
    <div
      v-for="item in secondaryCategs"
      :key="item.id"
      class="
        pb-4
        border
        col-span-12
        sm:col-span-6
        md:col-span-5
        lg:col-span-4
        duration-500
        ease-in-out
        transform
        transition-gpu
        hover:scale-105
        shadow-md
        hover:shadow-lg
        h-96
      "
    >
      <a
        class="
          xl:mb-0
          lg:mb-0
          md:mb-0
          flex flex-col
          items-center
          justify-center
          h-full
        "
        :href="`?secondary_categ=${item.slug}`"
        :title="item.categ_name"
        @click.prevent="updateQuery('secondary_categ', item.slug)"
      >
        <div class="relative z-10">
          <img
            v-if="item.image"
            loading="lazy"
            class="w-full transition duration-700 ease-in-out"
            :src="$getStrapiMedia(item.image.url)"
            :alt="item.categ_name"
          />
        </div>

        <div class="flex flex-col p-2 justify-center" style="flex: 2 1 auto">
          <h3 class="text-xl italic text-center pb-4">
            {{ item.categ_name }}
          </h3>
          <div v-if="item.description" class="line-clamp-3 text-sm pl-3">
            {{ item.description }}
          </div>
        </div>
      </a>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { productSecondaryCategoriesQuery } from '@/apollo/queries/product/prodSecondaryCategs.js'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'ProductSecondaryCategories',
  mixins: [imageUrlManipulation],
  props: {
    updateQuery: {
      type: Function,
      default: () => 1,
    },
  },
  data() {
    return {
      secondaryCategs: [],
    }
  },
  async fetch() {
    const cats = await this.$strapi.graphql({
      query: productSecondaryCategoriesQuery(),
    })
    this.secondaryCategs = cats.productSecondaryCategories
  },
})
</script>

<style scoped></style>
