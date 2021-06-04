<template>
  <div>
    <button class="snipcart-checkout">
      <span class="is-flex is-align-content-center is-justify-content-between">
        <CartButton color="indigo"></CartButton>
        <small class="snipcart-total-price pl-3"></small>
      </span>
    </button>
    <button class="snipcart-customer-signin">
      <UserImage color="indigo" width="30" height="50"></UserImage>
      Account
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
    CartButton: () => import('@/components/icons/CartButton.vue'),
    UserImage: () => import('@/components/icons/UserImage.vue'),
  },
  data() {
    return {
      cartIcon: mdiCartOutline,
    }
  },
})
</script>

<style></style>
