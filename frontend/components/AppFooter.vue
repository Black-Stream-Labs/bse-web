<template>
  <footer
    class="pt-28 pb-16 px-4 w-full text-gray-50 bg-gray-800 text-sm flex flex-col"
  >
    <div
      class="md:flex justify-between items-center max-w-5xl mx-auto w-full flex-grow"
    >
      <div class="mb-4 md:mb-0">
        <p class=" ">Black Stream Education</p>
      </div>

      <div class="flex justify-center flex-col items-center">
        <a
          href="#"
          class="hover:text-gray-700 border rounded-full border-transparent m-2 p-3 inline-flex hover:border-white"
        >
          <TwitterImage :color="dinamicColor"></TwitterImage>
        </a>
        <a
          href="#"
          class="hover:text-gray-700 border rounded-full border-transparent m-2 p-3 inline-flex hover:border-white"
        >
          <GithubImage :color="dinamicColor"></GithubImage>
        </a>
        <a
          href="#"
          class="hover:text-gray-700 border rounded-full border-transparent m-2 p-3 inline-flex hover:border-white"
        >
          <FacebookImage :color="dinamicColor"></FacebookImage>
        </a>
      </div>
    </div>
    <div
      class="flex flex-col sm:flex-row items-center justify-center w-full max-w-5xl mx-auto flex-grow-0 pt-10"
    >
      Designed and built with

      <a
        href="https://strapi.com"
        target="_blank"
        rel="noopener"
        title="Strapi"
        class="m-2 p-2 border rounded border-transparent hover:border-white"
      >
        <StrapiLogo :color="dinamicColor" width="60"></StrapiLogo>
      </a>
      <span> by </span>
      <a
        href="https://threebros.design"
        target="_blank"
        rel="noopener"
        title="ThreeBros Design"
        class="m-2 p-2 border rounded border-transparent hover:border-white"
      >
        <ThreeBros :color="dinamicColor" width="100"></ThreeBros>
      </a>
    </div>
  </footer>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import ThreeBros from '@/components/icons/ThreeBros.vue'
import StrapiLogo from '@/components/icons/StrapiLogo.vue'
import FacebookImage from '@/components/icons/FacebookImage.vue'
import GithubImage from '@/components/icons/GithubImage.vue'
import TwitterImage from '@/components/icons/TwitterImage.vue'
export default Vue.extend({
  name: 'AppFooter',
  components: {
    ThreeBros,
    StrapiLogo,
    FacebookImage,
    GithubImage,
    TwitterImage,
  },
  data() {
    return {
      dinamicColor: 'white',
    }
  },
  watch: {
    '$colorMode.preference': {
      handler() {
        this.checkColor()
      },
      deep: true,
      immediate: false,
    },
  },
  mounted() {
    this.$root.$on('changeColor', () => {
      this.$nextTick(() => {
        this.checkColor()
      })
    })
  },
  beforeMount() {
    this.$nextTick(() => {
      this.checkColor()
    })
  },
  methods: {
    checkColor() {
      localStorage['nuxt-color-mode'] &&
      localStorage['nuxt-color-mode'] === 'light'
        ? (this.dinamicColor = 'white')
        : (this.dinamicColor = 'white')
    },
  },
})
</script>

<style scoped></style>
