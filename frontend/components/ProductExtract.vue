<template>
  <div class="mb-6 max-w-xs rounded-lg shadow-lg border col-span-1 h-full">
    <div
      class="
        h-full
        shadow
        hover:shadow-lg
        transition
        duration-300
        ease-in-out
        xl:mb-0
        lg:mb-0
        md:mb-0
        mb-6
        group
        flex flex-col
      "
    >
      <div class="overflow-hidden relative z-10">
        <NuxtLink
          class="inline-flex"
          :to="`/products/${product.slug}`"
          :title="product.product_name"
        >
          <img
            class="
              w-full
              rounded
              transition
              duration-700
              ease-in-out
              group-hover:opacity-60
            "
            :src="$getStrapiMedia(product.product_main_image.url)"
            :alt="product.product_name"
          />
        </NuxtLink>
      </div>

      <div class="flex flex-col p-2 justify-center" style="flex: 2 1 auto">
        <div class="flex justify-between items-center">
          <h2 class="text-xl italic">
            <NuxtLink
              class="hover:underline capitalize"
              :to="`/products/${product.slug}`"
            >
              {{ product.product_name }}
            </NuxtLink>
          </h2>
          <span class="capitalize text-xs font-extrabold italic mt-5">
            Price: <b>£{{ product.price }}</b>
          </span>
        </div>
        <div class="line-clamp-3 text-sm">
          {{ product.product_description }}
        </div>
      </div>
      <div class="flex justify-between items-center p-2">
        <button
          class="
            px-2
            py-1
            text-xs
            border
            rounded
            border-gray-400
            dark:bg-gray-900 dark:text-white dark:border-gray-50
            snipcart-add-item
          "
          :data-item-id="product.id"
          :data-item-price="product.price"
          :data-item-url="`${$route.fullPath}`"
          :data-item-description="product.product_description"
          :data-item-image="$getStrapiMedia(product.product_main_image.url)"
          :data-item-name="product.product_name"
        >
          Add to cart
        </button>
        <NuxtLink
          class="
            px-2
            py-1
            text-xs
            border
            rounded
            border-gray-400
            dark:bg-gray-900 dark:text-white dark:border-gray-50
          "
          :to="`/products/${product.slug}`"
        >
          Details &rarr;
        </NuxtLink>
      </div>
    </div>
  </div>
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
