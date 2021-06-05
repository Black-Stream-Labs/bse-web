<template>
  <div class="flex items-center justify-center">
    <button class="snipcart-checkout px-2 py-2 mr-3">
      <ShoppingCart :color="dinamicColor"></ShoppingCart>
      <!-- <small class="snipcart-total-price pl-3 hidden md:inline-block"></small> -->
    </button>
    <button class="snipcart-customer-signin px-2 py-2">
      <UserImage :color="dinamicColor"></UserImage>
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
      dinamicColor: 'white',
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.checkColor()
    })
    this.$root.$on('changeColor', () => {
      this.$nextTick(() => {
        this.checkColor()
      })
    })
  },
  methods: {
    checkColor() {
      localStorage['nuxt-color-mode'] &&
      localStorage['nuxt-color-mode'] !== 'light'
        ? (this.dinamicColor = 'white')
        : (this.dinamicColor = 'indigo')
    },
  },
})
</script>

<style></style>
