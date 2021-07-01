<template>
  <section
    class="
      section
      py-20
      bg-gray-100
      text-gray-800
      dark:bg-gray-900 dark:text-white
    "
  >
    <div class="container max-w-5xl mx-auto px-4">
      <div class="md:block">
        <div class="pb-8 mt-auto">
          <div class="mx-auto flex justify-between items-center">
            <div class="title w-2/5">
              <h1 class="text-2xl md:text-3xl mb-8 mt-16 capitalize">
                {{ title }}
              </h1>

              <p v-if="subtitle" class="">
                {{ subtitle }}
              </p>
            </div>

            <div
              v-if="headerimage"
              class="
                mb-6
                mt-12
                w-3/5
                hidden
                md:flex
                justify-center
                align-center
              "
            >
              <img :src="$getStrapiMedia(headerimage)" alt="header image" />
            </div>
            <div
              v-else
              class="mb-6 mt-12 w-3/5 hidden md:flex justify-end align-center"
            >
              <LogoImage :color="dinamicColor" width="200" height="200" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'
import LogoImage from '@/components/icons/LogoImage.vue'
export default Vue.extend({
  components: {
    LogoImage,
  },
  mixins: [imageUrlManipulation],
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
  },
  data() {
    return {
      dinamicColor: 'indigo',
    }
  },
  mounted() {
    this.$root.$on('updateImageColor', (data: string) => {
      this.dinamicColor = data
    })
  },
})
</script>

<style scoped></style>
