<template>
  <section
    class="section py-20 text-white dark:bg-gray-900 dark:text-white"
    :style="
      $store.state.fullColor
        ? `background: linear-gradient(270deg, var(--background-start) 0%, var(--background-end) 100%)`
        : ''
    "
  >
    <div class="container max-w-5xl mx-auto px-4">
      <div class="md:block">
        <div class="pb-8 mt-auto">
          <div class="mx-auto flex justify-between items-center">
            <div class="title w-2/5">
              <h1 class="text-2xl md:text-3xl mb-8 mt-16 capitalize">
                {{ title }}
              </h1>
            </div>

            <div
              v-if="
                selectedImage &&
                product.product_images &&
                product.product_images.length > 0
              "
              class="
                mb-6
                mt-12
                w-3/5
                hidden
                md:grid
                grid-cols-4
                space-y-2
                gap-4
                grid-rows-3
              "
            >
              <div class="w-full col-span-4 row-span-2 overflow-hidden">
                <img
                  height="450"
                  loading="lazy"
                  class="object-cover"
                  :src="$getStrapiMedia(selectedImage)"
                  :alt="`${title} image`"
                  style="height: 450px"
                />
              </div>
              <div
                v-if="
                  product.product_images && product.product_images.length > 0
                "
                class="row-span-1 col-span-4 w-full"
              >
                Other Images

                <section
                  id="photos"
                  class="my-5 grid grid-cols-1 md:grid-cols-4 gap-4"
                >
                  <button
                    class="hover:opacity-75"
                    target="_new"
                    @click="selectImage(headerimage)"
                  >
                    <img
                      loading="lazy"
                      height="36"
                      class="w-full h-36 object-cover"
                      :src="$getStrapiMedia(headerimage)"
                      :alt="product.product_name"
                    />
                  </button>
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
                </section>
              </div>
            </div>
            <div
              v-else
              class="mb-6 mt-12 w-3/5 hidden md:flex justify-end align-center"
            >
              <LogoImage width="200" height="200" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'
import LogoImage from '@/components/icons/LogoImage'

export default Vue.extend({
  name: 'PageProductHero',
  components: {
    LogoImage,
  },
  mixins: [imageUrlManipulation],
  props: {
    product: {
      type: Object,
      default: () => {},
      required: true,
    },
    title: {
      type: String,
      default: '',
    },

    headerimage: {
      type: [String, null],
      default: null,
    },
  },
  data() {
    return {
      selectedImage: null,
    }
  },
  mounted() {
    this.selectedImage = this.headerimage
  },
  methods: {
    selectImage(image: any) {
      if (typeof image !== 'string') {
        const { url } = image
        this.selectedImage = url
      } else {
        this.selectedImage = image
      }
    },
  },
})
</script>

<style scoped></style>
