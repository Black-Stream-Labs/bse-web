<template>
  <div>
    <PageProductHero v-if="product" :product="product" />

    <div class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4 min-h-1/2">
        <div v-if="updatedContent" class="page-content pb-10">
          <div class="flex items-center">
            <a
              href="#"
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
              aria-label="Go Back to Product Summary including the Search Terms and Filters"
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
              @click.prevent="$router.go(-1)"
            >
              <LeftArrow></LeftArrow>
              <span class="px-4"> back to products </span>
            </a>
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
                    v-for="cat in product.product_main_categories"
                    :key="cat.slug"
                    :to="`/shop/categories/${cat.slug}`"
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
                  <NuxtLink
                    v-for="cat in product.product_secondary_categories"
                    :key="cat.slug"
                    :to="`/shop/categories/${cat.slug}`"
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
                <div
                  class="min-h-1/3"
                  v-html="$md.render(updatedContent)"
                ></div>

                <div class="pt-6">
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
                  <hr class="w-full my-5" />
                  <div class="grid grid-cols-12 gap-4">
                    <ProductExtract
                      v-for="(prod, ind) in similarProducts"
                      :key="`similar-${ind}`"
                      :product="prod"
                    ></ProductExtract>
                  </div>
                </div>
              </div>
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
import PageProductHero from '@/components/hero/PageProductHero'
import ProductExtract from '@/components/shop/ProductExtract'
import LeftArrow from '@/components/icons/LeftArrow'
import imageUrlManipulation, {
  formatContentImageUrl,
} from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'SingleProductPage',
  components: {
    PageProductHero,
    ProductExtract,
    LeftArrow,
  },
  mixins: [imageUrlManipulation],
  async asyncData({ $strapi, params }) {
    const data = await $strapi.find('products', {
      slug: params.slug,
    })
    console.log(data[0])
    const product = data[0]
    const categs = []
    if (product.product_main_categories.length > 0) {
      product.product_main_categories.forEach((el: any) =>
        categs.push(['product_main_categories.slug', el.slug])
      )
    }
    if (product.product_secondary_categories.length > 0) {
      product.product_secondary_categories.forEach((el: any) =>
        categs.push(['product_secondary_categories.slug', el.slug])
      )
    }

    const similar = await $strapi.find('products', categs)
    const similarProducts = similar.filter(
      (el: any) => el.product_name !== product.product_name
    )
    return {
      product,
      similarProducts,
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
  },
})
</script>
