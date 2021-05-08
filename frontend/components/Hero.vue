<template>
  <section class="hero" :class="[randomClass, size]">
    <div class="hero-head">
      <div class="container">
        <AppNavbar></AppNavbar>
      </div>
    </div>
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
            <b-image
              v-if="headerimage"
              :src="`/api/v1${headerimage}`"
              :responsive="true"
              ratio="1by1"
            >
            </b-image>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import AppNavbar from '@/components/AppNavbar'
export default Vue.extend({
  components: {
    AppNavbar,
  },
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

  computed: {
    randomClass() {
      const classes = ['is-light', 'is-info', 'is-success', 'is-light']
      return classes[Math.floor(Math.random() * classes.length)]
    },
  },
})
</script>

<style scoped>
/deep/ .b-skeleton {
  height: 100%;
  position: absolute;
  top: 0;
}
</style>
