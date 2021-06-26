<template>
  <div>
    <Hero
      :title="product.product_name"
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
                <div class="capitalize font-extrabold italic mb-5">
                  Price: <b>£{{ product.price }}</b>
                </div>
                <div class="capitalize font-extrabold italic mb-5">
                  Category:

                  <NuxtLink
                    v-for="cat in product.product_categories"
                    :key="cat.slug"
                    :to="`/products/categories/${cat.slug}`"
                    class="
                      text-gray-500
                      font-light
                      rounded
                      bg-gray-200
                      px-2
                      py-1
                      m-1
                      dark:bg-gray-700 dark:text-gray-300
                    "
                  >
                    {{ cat.categ_name }}
                  </NuxtLink>
                </div>
                <div class="capitalize font-extrabold italic mb-5">
                  Digital Product:
                  <b
                    class="
                      text-gray-500
                      font-light
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

                <div>
                  Extra Images

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
                          class="w-full h-36 object-cover"
                          :src="$getStrapiMedia(image.formats.small.url)"
                          :alt="image.name.split('.')[0]"
                        />
                      </button>
                    </template>
                    <VModal
                      :image="selectedImage"
                      :title="selectedImage ? selectedImage.caption : null"
                      :opened="selectedImage ? true : false"
                      @close="selectedImage = null"
                    >
                      <img
                        v-if="selectedImage"
                        class="w-full h-128 object-cover"
                        :src="$getStrapiMedia(selectedImage.formats.large.url)"
                        :alt="selectedImage.caption || 'Product Image'"
                      />
                    </VModal>
                  </section>
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
import imageUrlManipulation, {
  formatContentImageUrl,
} from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'SingleProductPage',
  components: {
    Hero,
    ProductsSidebar,
    VModal,
  },
  mixins: [imageUrlManipulation],

  layout: 'product',
  data() {
    return {
      product: {},
      showModal: false,
      selectedImage: null,
    }
  },
  async fetch() {
    const data = await this.$strapi.find('products', {
      slug: this.$route.params.slug,
    })
    this.product = data[0]
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
  methods: {
    selectImage(image: any) {
      this.showModal = true
      const { caption, alternativeText, formats, url } = image
      this.selectedImage = { caption, alternativeText, formats, url }
    },
  },
})
</script>
