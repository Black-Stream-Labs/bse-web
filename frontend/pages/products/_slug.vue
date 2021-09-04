<template>
  <div>
    <Hero
      v-if="product"
      :title="product.product_name"
      :headerimage="updatedHeaderIMage"
    />

    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div v-if="updatedContent" class="page-content pb-10">
          <div class="flex items-center">
            <NuxtLink
              to="/products"
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
              <LeftArrow></LeftArrow>
              <span class="px-4"> back to products </span>
            </NuxtLink>
          </div>
          <div class="my-8">
            <div
              class="grid md:grid-flow-col md:grid-cols-3 md:grid-rows-1 gap-4"
            >
              <div class="col-span-2">
                <div class="capitalize font-extrabold italic mb-5">
                  Price: <b>£{{ product.price }}</b>
                </div>
                <div class="mb-5">
                  <span class="capitalize font-extrabold italic">
                    Category:
                  </span>

                  <NuxtLink
                    v-for="cat in product.product_categories"
                    :key="cat.slug"
                    :to="`/products/categories/${cat.slug}`"
                    class="
                      text-gray-700
                      font-light
                      capitalize
                      rounded
                      bg-gray-200
                      px-2
                      py-1
                      text-xs
                      m-1
                      dark:bg-gray-700 dark:text-gray-300
                    "
                  >
                    {{ cat.categ_name }}
                  </NuxtLink>
                </div>
                <div class="mb-5">
                  <span class="capitalize font-extrabold italic">
                    Digital Product:
                  </span>
                  <b
                    class="
                      text-gray-700
                      font-light
                      text-xs
                      capitalize
                      rounded
                      bg-gray-200
                      px-2
                      py-1
                      m-1
                      dark:bg-gray-700 dark:text-gray-300
                    "
                  >
                    {{ product.is_digital_product ? 'Yes' : 'No' }}
                  </b>
                </div>
                <div v-html="$md.render(updatedContent)"></div>

                <div
                  v-if="
                    product.product_images && product.product_images.length > 0
                  "
                  class="pt-5"
                >
                  Product Images

                  <section
                    id="photos"
                    class="my-5 grid grid-cols-1 md:grid-cols-4 gap-4"
                  >
                    <template v-for="image in product.product_images">
                      <button
                        :key="image.id"
                        class="hover:opacity-75"
                        target="_new"
                        @click="selectImage(image)"
                      >
                        <img
                          loading="lazy"
                          height="36"
                          class="w-full h-36 object-cover"
                          :src="$getStrapiMedia(image.formats.small.url)"
                          :alt="image.name.split('.')[0]"
                        />
                      </button>
                    </template>
                    <client-only>
                      <VModal
                        :image="selectedImage"
                        :title="selectedImage ? selectedImage.caption : null"
                        :opened="selectedImage ? true : false"
                        @close="selectedImage = null"
                      >
                        <img
                          v-if="selectedImage"
                          loading="lazy"
                          height="128"
                          class="w-full h-128 object-cover"
                          :src="
                            $getStrapiMedia(selectedImage.formats.large.url)
                          "
                          :alt="selectedImage.caption || 'Product Image'"
                        />
                      </VModal>
                    </client-only>
                  </section>
                </div>
                <div>
                  <button
                    class="
                      px-4
                      py-3
                      border border-gray-400
                      text-white
                      dark:border-gray-50
                      snipcart-add-item
                    "
                    :data-item-id="product.id"
                    :data-item-price="product.price"
                    :data-item-url="`${$route.fullPath}`"
                    :data-item-description="product.product_description"
                    :data-item-image="
                      $getStrapiMedia(product.product_main_image.url)
                    "
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
                </div>
                <div v-if="similarProducts.length > 0">
                  <h3 class="mt-16">Similar Products</h3>
                  <hr class="my-5" />
                  <div
                    class="
                      w-full
                      h-full
                      md:h-auto
                      grid grid-cols-1
                      md:grid-cols-2
                      gap-3
                      py-2
                    "
                  >
                    <ProductExtract
                      v-for="(prod, ind) in similarProducts"
                      :key="`similar-${ind}`"
                      :product="prod"
                    ></ProductExtract>
                  </div>
                </div>
              </div>
              <ProductsSidebar></ProductsSidebar>
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
import VModal from '@/components/reusable/VModal'
import ProductsSidebar from '@/components/ProductsSidebar'
import ProductExtract from '@/components/ProductExtract'
import LeftArrow from '@/components/icons/LeftArrow'
import imageUrlManipulation, {
  formatContentImageUrl,
} from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'SingleProductPage',
  components: {
    Hero,
    ProductsSidebar,
    VModal,
    ProductExtract,
    LeftArrow,
  },
  mixins: [imageUrlManipulation],

  data() {
    return {
      product: {},
      similarProducts: [],
      showModal: false,
      selectedImage: null,
    }
  },
  async fetch() {
    const data = await this.$strapi.find('products', {
      slug: this.$route.params.slug,
    })
    this.product = data[0]
    if (data[0].product_filter) {
      const categs = data[0].product_categories.map((el: any) => [
        'product_categories.slug',
        el.slug,
      ])
      const similar = await this.$strapi.find('products', categs)
      this.similarProducts = similar.filter(
        (el: any) => el.product_name !== this.product.product_name
      )
    }
  },
  computed: {
    updatedContent() {
      if (this.product.product_description) {
        return formatContentImageUrl(this.product.product_description)
      } else {
        return null
      }
    },
    updatedHeaderIMage() {
      if (this.product.product_main_image) {
        return this.product.product_main_image.url
      } else {
        return null
      }
    },
  },
  mounted() {},

  methods: {
    selectImage(image: any) {
      this.showModal = true
      const { caption, alternativeText, formats, url } = image
      this.selectedImage = { caption, alternativeText, formats, url }
    },
  },
})
</script>
