<template>
  <div class="flex items-center justify-center">
    <button class="snipcart-checkout px-2 py-2">
      <span class="flex items-center justify-between">
        <ShoppingCart :color="dinamicColor"></ShoppingCart>
        <small class="snipcart-total-price pl-3 hidden md:inline-block"></small>
      </span>
    </button>
    <button class="snipcart-customer-signin px-2 py-2">
      <span class="flex items-center justify-between">
        <UserImage :color="dinamicColor"></UserImage>
        <span class="hidden md:inline-block"> </span>
      </span>
    </button>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { mdiCartOutline } from '@mdi/js'
export default Vue.extend({
  name: 'SnipcartButton',
  components: {
    ShoppingCart: () => import('@/components/icons/ShoppingCart.vue'),
    UserImage: () => import('@/components/icons/UserImage.vue'),
  },
  data() {
    return {
      cartIcon: mdiCartOutline,
      dinamicColor: 'white',
    }
  },
  mounted() {
    this.$root.$on('changeColor', () => {
      localStorage.theme === 'light'
        ? (this.dinamicColor = 'indigo')
        : (this.dinamicColor = 'white')
    })
  },
})
</script>

<style></style>
