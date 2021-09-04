<template>
  <section class="py-20 custom-background bg-gray-100 text-gray-800 border-b-2">
    <div class="container mx-auto">
      <div class="px-10 md:block">
        <div class="pb-8 mt-auto">
          <div class="max-w-5xl mx-auto flex justify-between items-center">
            <div class="title w-2/5">
              <h1 class="text-2xl md:text-3xl mb-8 mt-16">
                {{ title }}
              </h1>

              <p v-if="subtitle" class="text-gray-800">
                {{ subtitle }}
              </p>
            </div>

            <div class="mb-6 mt-12 w-3/5 hidden md:flex items-end justify-end">
              <LogoImage width="350" height="350"></LogoImage>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import LogoImage from '@/components/icons/LogoImage.vue'
export default Vue.extend({
  name: 'HeroHomepage',
  components: {
    LogoImage,
  },
  props: {
    title: {
      type: String,
      default: '',
    },
    subtitle: {
      type: String,
      default: '',
    },
    headerimage: {
      type: [String, null],
      default: null,
    },
    size: {
      type: String,
      default: 'is-small',
    },
  },

  data() {
    return {
      // isOpen: false,
    }
  },
})
</script>

<style scoped></style>
