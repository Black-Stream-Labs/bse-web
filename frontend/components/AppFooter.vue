<template>
  <footer class="footer">
    <div class="content has-text-centered">
      <p class=" ">Black Stream Education</p>
      <div class="is-flex is-align-content-center is-justify-content-center">
        <a href="https://twitter.com/strapijs" class="is-inline-flex p-3">
          <TwitterImage />
        </a>
        <a href="https://facebook.com/strapijs" class="is-inline-flex p-3">
          <FacebookImage />
        </a>
        <a
          href="https://github.com/strapi/strapi-starter-nuxt-e-commerce"
          class="is-inline-flex p-3"
        >
          <GithubImage />
        </a>
      </div>
    </div>
  </footer>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import TwitterImage from '@/components/icons/TwitterImage'
import FacebookImage from '@/components/icons/FacebookImage'
import GithubImage from '@/components/icons/GithubImage'
export default Vue.extend({
  name: 'AppFooter',
  components: {
    TwitterImage,
    FacebookImage,
    GithubImage,
  },
})
</script>

<style scoped></style>
