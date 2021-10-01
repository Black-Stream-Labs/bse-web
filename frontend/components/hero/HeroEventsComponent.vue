<template>
  <section
    class="section py-20 text-white dark:bg-gray-900 dark:text-white"
    :style="
      $store.state.fullColor
        ? `background: linear-gradient(270deg, var(--background-start) 0%, var(--background-end) 100%)`
        : ''
    "
  >
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

              <p v-if="subtitle" class="">
                {{ subtitle }}
              </p>
            </div>

            <div class="mt-24 w-3/5 hidden md:flex justify-end items-end">
              <SpeakingIcon width="300" height="300" color="white" />
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
import SpeakingIcon from '../icons/SpeakingIcon.vue'
import imageUrlManipulation from '@/mixins/updateImageUrl.js'

export default Vue.extend({
  name: 'HeroEventsComponent',

  components: {
    SpeakingIcon,
  },
  mixins: [imageUrlManipulation],
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
  },
  data() {
    return {}
  },

  mounted() {},
})
</script>

<style scoped></style>
