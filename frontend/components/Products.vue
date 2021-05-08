<template>
  <div class="columns is-multiline is-centered is-mobile">
    <div
      v-for="product in products"
      :key="product.id"
      class="column is-full-mobile is-one-third-tablet is-one-quarter-desktop is-align-self-stretch"
    >
      <div class="card bm--card-equal-height">
        <header class="card-image pl-4 pt-4">
          <figure class="image is-64x64">
            <img class="" :src="`/api/strapi${product.image.url}`" />
          </figure>
        </header>
        <main class="card-content py-3">
          <div class="content">
            <strong>{{ product.title }} sticker. </strong>
            <br />
            {{ product.description }}
          </div>
        </main>
        <footer class="card-footer">
          <NuxtLink :to="`/products/${product.slug}`" class="card-footer-item">
            More Details
          </NuxtLink>
        </footer>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
export default Vue.extend({
  name: 'ProductsPage',
  layout: 'product',
  props: {
    products: { type: Array, default: () => [] },
  },
})
</script>
