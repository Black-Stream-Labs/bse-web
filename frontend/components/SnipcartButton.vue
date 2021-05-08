<template>
  <b-navbar-item class="snipcart-checkout">
    <span class="is-flex is-align-content-center is-justify-content-between">
      <CartButton color="indigo"></CartButton>
      <small class="snipcart-total-price pl-3"></small>
    </span>
  </b-navbar-item>
</template>

<script lang="ts">
import Vue from 'vue'
import { mdiCartOutline } from '@mdi/js'
export default Vue.extend({
  name: 'SnipcartButton',
  data() {
    return {
      cartIcon: mdiCartOutline,
    }
  },
})
</script>

<style scoped lang="scss"></style>
