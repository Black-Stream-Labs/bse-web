<template>
  <div class="flex items-center justify-center">
    <button class="snipcart-checkout px-2 py-2 mr-3">
      <ShoppingCart :color="color"></ShoppingCart>
      <!-- <small class="snipcart-total-price pl-3 hidden md:inline-block"></small> -->
    </button>
    <button class="snipcart-customer-signin px-2 py-2">
      <UserImage :color="color"></UserImage>
    </button>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import { mdiCartOutline } from '@mdi/js'
import ShoppingCart from '@/components/icons/ShoppingCart.vue'
import UserImage from '@/components/icons/UserImage.vue'

export default Vue.extend({
  name: 'SnipcartButton',
  components: {
    ShoppingCart,
    UserImage,
  },
  props: {
    color: {
      type: String,
      default: 'indigo',
    } as PropOptions,
  },
  data() {
    return {
      cartIcon: mdiCartOutline,
    }
  },
  mounted() {},
  methods: {},
})
</script>

<style></style>
