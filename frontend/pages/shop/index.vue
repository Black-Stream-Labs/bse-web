<template>
  <div>
    <Hero title="Our Products"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto py-10 px-4">
        <div class="my-12">
          <div
            class="
              grid grid-flow-row-dense
              md:grid-flow-col md:grid-cols-3
              gap-4
            "
          >
            <main class="row-start-2 md:row-start-1 md:col-span-2 min-h-1/2">
              <ProductMainCategories
                v-show="!loading && showMainCategs && !showSecondaryCategs"
                :update-query="updateQuery"
              />
              <ProductSecondaryCategories
                v-show="!loading && showSecondaryCategs && !showMainCategs"
                :update-query="updateQuery"
              />
              <div
                v-show="loading && !showSecondaryCategs && !showMainCategs"
                class="grid grid-cols-12 gap-4"
              >
                loading products
              </div>
              <div
                v-show="
                  !loading &&
                  !showMainCategs &&
                  !showSecondaryCategs &&
                  products.length > 0
                "
                class="grid grid-cols-12 gap-4"
              >
                <ProductExtract
                  v-for="(product, ind) in products"
                  :key="`prod-${ind}`"
                  :product="product"
                />
              </div>
            </main>
            <ProductsSidebar></ProductsSidebar>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/hero/Hero'
import ProductMainCategories from '@/components/shop/ProductMainCategories'
import ProductSecondaryCategories from '@/components/shop/ProductSecondaryCategories'
import ProductExtract from '@/components/shop/ProductExtract'
import ProductsSidebar from '@/components/shop/ProductsSidebar'
import { allProdQuery } from '@/apollo/queries/product/allProducts.js'
export default Vue.extend({
  name: 'MainProductPage',
  components: {
    Hero,
    ProductMainCategories,
    ProductsSidebar,
    ProductSecondaryCategories,
    ProductExtract,
  },
  data() {
    return {
      products: [],
      showMainCategs: true,
      loading: false,
      showSecondaryCategs: false,
    }
  },
  watch: {
    '$route.query': {
      handler(value) {
        if (value.sort) {
          this.showMainCategs = false
          this.showSecondaryCategs = false
          this.searchProducts()
        } else if (value.q) {
          this.showMainCategs = false
          this.showSecondaryCategs = false
          this.searchProducts()
        } else if (value.main_categ && value.secondary_categ) {
          this.showMainCategs = false
          this.showSecondaryCategs = false
          this.searchProducts()
        } else if (value.main_categ) {
          this.showMainCategs = false
          this.showSecondaryCategs = true
        } else {
          this.showMainCategs = true
          this.showSecondaryCategs = false
        }
      },
      immediate: true,
      deep: true,
    },
  },

  mounted() {
    // this.$root.$on('clearProductFilters', () => {
    //   this.$router.push('/products')
    //   this.$nextTick(() => {
    //     this.showMainCategs = true
    //     this.showSecondaryCategs = true
    //   })
    // })
    this.$root.$on('updatecategs', (data: any) => {
      if (data.secondary) {
        this.showMainCategs = false
        this.showSecondaryCategs = true
      } else {
        this.showSecondaryCategs = false
        this.showMainCategs = false
      }
    })
    this.$root.$on('updateFromSidebar', async (data: unknown) => {
      await this.updateQuery(data)
      // await this.searchProducts()
      this.showMainCategs = true
      this.showSecondaryCategs = false
    })
    // this.$root.$on('filtersUpdated', async (data: unknown) => {
    //   await this.updateQuery(data)
    //   await this.searchProducts()
    // })
    this.$root.$on('noSortingNeeded', async () => {
      await this.updateQuery({ sort: null })
      await this.searchProducts()
      this.showSecondaryCategs = false
      this.showMainCategs = true
    })
    this.$root.$on('sortBy', async (data: any) => {
      await this.updateQuery(data)
      await this.searchProducts()
      this.showSecondaryCategs = false
      this.showMainCategs = false
    })
  },
  methods: {
    searchProducts() {
      this.loading = true
      setTimeout(async () => {
        let updatedProd = []
        const query = await { ...this.$route.query }
        if (!!query && Object.keys(query).length > 0) {
          const queryEl = []
          Object.keys(query).forEach((queryType: string) => {
            if (queryType === 'q') {
              queryEl.push(['product_name_contains', query.q])
            }
            if (queryType === 'main_categ') {
              if (decodeURIComponent(query.main_categ).split(',').length > 1) {
                decodeURIComponent(query.main_categ)
                  .split(',')
                  .forEach((el: any) => {
                    queryEl.push(['product_main_categories.slug', el])
                  })
              } else {
                queryEl.push(['product_main_categories.slug', query.main_categ])
              }
            }
            if (queryType === 'secondary_categ') {
              if (
                decodeURIComponent(query.secondary_categ).split(',').length > 1
              ) {
                decodeURIComponent(query.secondary_categ)
                  .split(',')
                  .forEach((el: any) => {
                    queryEl.push(['product_secondary_categories.slug', el])
                  })
              } else {
                queryEl.push([
                  'product_secondary_categories.slug',
                  query.secondary_categ,
                ])
              }
            }
            if (queryType === 'sort') {
              switch (query.sort) {
                case 'priceAscending':
                  queryEl.push([`_sort`, 'price:ASC'])
                  break

                case 'priceDescending':
                  queryEl.push([`_sort`, 'price:DESC'])
                  break
                case 'nameAscending':
                  queryEl.push([`_sort`, 'product_name:ASC'])

                  break
                case 'nameDescending':
                  queryEl.push([`_sort`, 'product_name:DESC'])

                  break
                case 'onlyDiscounts':
                  queryEl.push([`DiscountPercentage_null`, 'false'])
                  break

                default:
                  break
              }
            }
            // if (queryType === 'product_filter') {
            //   if (
            //     decodeURIComponent(query.product_filter).split(',').length > 1
            //   ) {
            //     decodeURIComponent(query.product_filter)
            //       .split(',')
            //       .forEach((el: any) => {
            //         queryEl.push(['product_filter.slug', el])
            //       })
            //   } else {
            //     queryEl.push(['product_filter.slug', query.product_filter])
            //   }
            // }
          })
          const prod = await this.$strapi.find('products', queryEl)
          updatedProd = prod
        } else {
          const data = await this.$strapi.graphql({
            query: allProdQuery(),
          })
          updatedProd = data.products
        }
        this.products = updatedProd
        this.loading = false
      }, 350)
    },
    updateQuery(keyOrObj: any, value: any) {
      const updatedQuery = { ...this.$route.query }
      if (keyOrObj === 'show_all') {
        Object.keys(updatedQuery).forEach((key) => {
          delete updatedQuery[key]
        })
        // this.$root.$emit('clearProductFilters')
      } else {
        const obj =
          typeof keyOrObj === 'string' ? { [keyOrObj]: value } : keyOrObj

        Object.keys(obj).forEach((key) => {
          const value = obj[key]

          if (value === null) {
            delete updatedQuery[key]
          } else {
            updatedQuery[key] = value
          }
        })
      }
      this.$router.push({ query: updatedQuery })
    },
  },
})
</script>
