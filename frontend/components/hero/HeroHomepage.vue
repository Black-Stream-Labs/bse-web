<template>
  <section class="py-20 custom-background bg-gray-100 text-gray-800 border-b-2">
    <div class="container max-w-5xl mx-auto px-4 min-h-1/4">
      <div class="md:block">
        <div class="pb-8 mt-auto">
          <div class="mx-auto flex justify-between items-center">
            <div class="title w-2/5">
              <h1
                class="text-3xl md:text-4xl lg:text-5xl mb-8 mt-16 capitalize"
              >
                {{ title }}
              </h1>

              <p v-if="subtitle" class="text-gray-800">
                {{ subtitle }}
              </p>
            </div>

            <div class="mt-24 w-3/5 hidden md:flex items-end justify-end">
              <LogoNotextCircle width="300" height="300"></LogoNotextCircle>
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
import LogoNotextCircle from '@/components/icons/LogoNotextCircle.vue'
export default Vue.extend({
  name: 'HeroHomepage',
  components: {
    LogoNotextCircle,
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
