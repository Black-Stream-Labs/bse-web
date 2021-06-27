<template>
  <div class="flex items-center justify-center">
    <button
      class="
        snipcart-checkout
        px-2
        py-2
        mr-3
        flex flex-col
        items-center
        justify-center
      "
    >
      <ShoppingCart></ShoppingCart>
      <small class="snipcart-total-price"></small>
    </button>
    <button class="snipcart-customer-signin px-2 py-2">
      <UserImage></UserImage>
    </button>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { mdiCartOutline } from '@mdi/js'
import ShoppingCart from '@/components/icons/ShoppingCart.vue'
import UserImage from '@/components/icons/UserImage.vue'

export default Vue.extend({
  name: 'SnipcartButton',
  components: {
    ShoppingCart,
    UserImage,
  },

  data() {
    return {
      cartIcon: mdiCartOutline,
    }
  },
})
</script>

<style></style>
