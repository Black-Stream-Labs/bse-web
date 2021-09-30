<template>
  <div
    class="
      pb-4
      border
      col-span-12
      sm:col-span-6
      md:col-span-5
      lg:col-span-4
      h-full
      duration-500
      ease-in-out
      transform
      transition-gpu
      hover:scale-105
      shadow-md
      hover:shadow-lg
    "
  >
    <div class="h-full flex flex-col items-center justify-center">
      <div class="overflow-hidden relative z-10" style="flex: 2 1 auto">
        <NuxtLink
          class="inline-flex"
          :to="`/shop/${product.slug}`"
          :title="product.product_name"
        >
          <img
            loading="lazy"
            class="
              w-full
              transition
              duration-700
              ease-in-out
              h-60
              object-contain
            "
            height="60"
            width="60"
            :src="$getStrapiMedia(product.product_main_image.url)"
            :alt="product.product_name"
          />
        </NuxtLink>
      </div>

      <div class="flex flex-col p-2 justify-center">
        <div class="flex justify-between items-center">
          <h2 class="text-xl italic">
            <NuxtLink
              class="hover:underline capitalize"
              :to="`/shop/${product.slug}`"
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
      <div class="w-full flex justify-between items-center p-2">
        <button
          class="
            px-2
            py-1
            text-xs
            border border-gray-400
            text-white
            dark:border-gray-50
            snipcart-add-item
          "
          :data-item-id="product.SKU"
          :data-item-price="product.price"
          :data-item-url="`${$route.fullPath}`"
          :data-item-description="product.product_description"
          :data-item-image="$getStrapiMedia(product.product_main_image.url)"
          :data-item-name="product.product_name"
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
        >
          Add to cart
        </button>
        <NuxtLink
          class="
            px-2
            py-1
            text-xs
            border border-gray-400
            text-white
            dark:border-gray-50
          "
          :to="`/shop/${product.slug}`"
          :class="
            $store.state.fullColor
              ? $store.state.fullColor.name === 'tgreen'
                ? 'bg-tgreen'
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
      required: true,
    },
  },
  fetchOnServer: true,
  fetchKey: 'product',
})
</script>

<style scoped></style>
