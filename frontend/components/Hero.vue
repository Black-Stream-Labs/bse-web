<template>
  <section class="py-20 custom-background bg-gray-100 text-gray-800 border-b-2">
    <div class="container mx-auto">
      <div class="px-4 md:block">
        <div class="pb-8 mt-auto">
          <div class="max-w-5xl mx-auto flex justify-between items-center">
            <div class="title w-2/5">
              <h1 class="text-2xl md:text-3xl mb-8 mt-16 font-serif">
                {{ title }}
              </h1>

              <p v-if="subtitle" class="text-gray-800">
                {{ subtitle }}
              </p>
            </div>

            <div v-if="headerimage" class="mb-6 mt-12 w-3/5 hidden md:block">
              <img :src="`/api/v1/${headerimage}`" alt="header image" />
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

  data() {
    return {
      isOpen: false,
    }
  },
})
</script>

<style scoped></style>
