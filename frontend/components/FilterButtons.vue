<template>
  <div class="columns is-mobile is-multiline is-centered">
    <div
      v-if="error"
      class="column is-full-mobile is-10-tablet is-8-desktop is-6-widescreen"
    >
      {{ error }}
    </div>
    <template v-else>
      <div class="column is-12">
        <NuxtLink
          to="/products"
          class="py-2 px-4 mr-2 button is-active is-outlined is-small is-rounded"
        >
          All Products
        </NuxtLink>
        <NuxtLink
          v-for="category in categories"
          :key="category.id"
          :to="`/products/categories/${category.slug}`"
          class="py-2 px-4 mr-2 button is-small is-rounded"
          :class="
            $route.params.slug &&
            $route.params.slug.toLowerCase() === category.name.toLowerCase()
              ? 'is-primary'
              : 'is-light'
          "
        >
          {{ category.name }}
        </NuxtLink>
      </div>
    </template>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import categoriesQuery from '~/apollo/queries/product/categories'
export default Vue.extend({
  name: 'FilterButtons',
  data() {
    return {
      categories: [],
      error: null,
    }
  },
  apollo: {
    categories: {
      prefetch: true,
      query: categoriesQuery,
    },
  },
})
</script>

<style lang="scss" scoped></style>
