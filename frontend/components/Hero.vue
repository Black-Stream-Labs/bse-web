<template>
  <section class="hero is-dark is-fullheight-with-navbar">
    <div class="hero-body py-12">
      <div class="container">
        <div
          class="columns is-mobile is-vcentered"
          :style="
            headerimage
              ? `background:url('/api/v1${headerimage}') right center no-repeat;
            background-size:contain; min-height: 10vw`
              : ''
          "
        >
          <div class="column is-12-mobile">
            <h1 v-if="title" class="title">
              {{ title }}
            </h1>
            <div v-if="subtitle" class="subtitle">{{ subtitle }}</div>
          </div>
          <div class="column is-8-mobile">
            <img v-if="headerimage" :src="`/api/v1${headerimage}`" />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
export default Vue.extend({
  props: {
    title: {
      type: String,
      default: '',
    } as PropOptions,
    subtitle: {
      type: String,
      default: '',
    } as PropOptions,
    headerimage: {
      type: [String, null],
      default: null,
    } as PropOptions,
    size: {
      type: String,
      default: 'is-small',
    } as PropOptions,
  },

  computed: {},
})
</script>

<style>
/* /deep/ .b-skeleton {
  height: 100%;
  position: absolute;
  top: 0;
} */
</style>
