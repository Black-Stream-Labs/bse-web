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
    "
  >
    <div v-if="product.product_main_image" class="md:w-1/4">
      <NuxtLink :to="`/products/${product.slug}`" class="dark:text-gray-50">
        <img
          class="w-full h-full object-cover"
          :src="$getStrapiMedia(product.product_main_image.url)"
          :alt="`${product.product_name} image`"
        />
      </NuxtLink>
    </div>

    <div
      class="px-4 py-4 w-full"
      :class="
        product.product_main_image && product.product_main_image.url
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
        <NuxtLink :to="`/products/${product.slug}`">
          {{ product.product_name }}
        </NuxtLink>
      </h3>
      <p>
        <span class="text-xs text-gray-500 italic dark:text-gray-200">
          Published -
          {{
            new Date(product.published_at).toLocaleDateString('en-GB', {
              day: 'numeric',
              year: 'numeric',
              month: 'short',
            })
          }}
        </span>
      </p>
      <div
        v-if="product.product_description"
        class="mb-4 w-full text-gray-700 dark:text-gray-100"
      >
        <div
          class="line-clamp-5"
          v-html="$md.render(product.product_description)"
        ></div>
      </div>

      <div class="flex justify-between align-center">
        <div class="w-3/4">
          <p
            v-if="
              product.product_categories &&
              product.product_categories.length > 0
            "
            id="categories"
          >
            <span class="text-xs">
              Categories:
              <NuxtLink
                v-for="cat in product.product_categories"
                :key="cat.id"
                :to="`/products/categories/${cat.slug}`"
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
                {{ cat.categ_name }}
              </NuxtLink>
            </span>
          </p>
        </div>
        <div class="w-1/4 flex flex-col align-end justify-end">
          <NuxtLink
            :to="`/products/${product.slug}`"
            class="
              text-right
              py-2
              text-indigo-600 text-xs
              uppercase
              hover:underline
            "
          >
            Details <span>&rarr;</span>
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
  name: 'ProductExtract',
  mixins: [imageUrlManipulation],

  props: {
    product: {
      type: Object,
      default: () => {},
    },
  },
  fetchOnServer: true,
  fetchKey: 'product-extract',
})
</script>

<style scoped></style>
