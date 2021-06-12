<template>
  <div>
    <Hero title="Our Authors"></Hero>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <BlogCateofies></BlogCateofies>
      </div>
    </section>
  </div>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import Hero from '@/components/Hero'
export default Vue.extend({
  name: 'SingleCategoryPage',
  components: {
    Hero,
  },
})
</script>
