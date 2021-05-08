<template>
  <div>
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div v-if="product.image" class="media-left">
            <figure class="image is-128x128">
              <img
                :src="$getStrapiMedia(product.image.formats.thumbnail.url)"
              />
            </figure>
          </div>
          <div class="media-content">
            <h4 class="title is-4">
              {{ product.title }} - ${{ product.price }}
            </h4>
          </div>
        </div>
        <div class="content">
          <div class="subtitle is-6">{{ product.description }}</div>
          <b-button
            v-if="product.status === 'published'"
            type="is-primary"
            class="snipcart-add-item mt-4 py-2 px-4"
            :data-item-id="product.id"
            :data-item-price="product.price"
            :data-item-url="`${$route.fullPath}`"
            :data-item-description="product.description"
            :data-item-image="`/api/${product.image.formats.thumbnail.url}`"
            :data-item-name="product.title"
            v-bind="customFields"
          >
            Add to cart
          </b-button>

          <div v-else class="text-center mr-10 mb-1">
            <div
              class="p-2 bg-indigo-800 items-center text-indigo-100 leading-none lg:rounded-full flex lg:inline-flex"
              role="alert"
            >
              <span
                class="flex rounded-full bg-indigo-500 uppercase px-2 py-1 text-xs font-bold mr-3"
              >
                Coming soon...
              </span>
              <span class="font-semibold mr-2 text-left flex-auto">
                This article is not available yet.
              </span>
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
import { ProductCustomFields, Product } from '~/types'
import singleProduct from '~/apollo/queries/product/product'
export default Vue.extend({
  name: 'ProductPage',
  layout: 'product',
  data() {
    return {
      product: {} as Product,
      error: {} as Error,
    }
  },
  async fetch() {
    // @ts-ignore
    const { data } = await this.$apolloProvider.defaultClient.query({
      query: singleProduct,
      variables: { slug: this.$route.params.slug },
    })
    this.product = data.products[0]
  },
  computed: {
    customFields(): any {
      return this.product.Custom_field.map((el: ProductCustomFields) => ({
        name: el.title,
        required: el.required,
        options: el.options,
      }))
        .map((x: any, index: number) =>
          Object.entries(x as any).map(([key, value]) => ({
            [`data-item-custom${
              index + 1
            }-${key.toString().toLowerCase()}`]: value,
          }))
        )
        .reduce((acc: any, curr: any) => acc.concat(curr), [])
        .reduce((acc: any, curr: any) => ({
          ...acc,
          ...curr,
        })) as Product
    },
  },
})
</script>
