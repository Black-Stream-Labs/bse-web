<template>
  <div>{{ page.title }}</div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'

export default Vue.extend({
  name: 'AboutUsPage',

  async asyncData({ $strapi }) {
    const page = await $strapi.$http.$get('about-us')
    return { page }
  },
})
</script>

<style scoped></style>
