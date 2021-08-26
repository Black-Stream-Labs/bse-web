<template>
  <div class="text-white flex flex-row flex-wrap">
    <div class="hidden md:block w-1/3 p-4 text-right">
      <LogoImage width="150" height="150"></LogoImage>
    </div>
    <div
      id="carousel"
      ref="carousel"
      class="md:w-2/3 masonry"
      :class="showAll ? '' : 'overflow-hidden max-h-96'"
    >
      <div
        v-for="(testim, ind) in testimonials"
        :key="ind"
        class="
          py-5
          px-6
          break-inside
          flex flex-wrap flex-col
          justify-around
          col-span-12
          md:col-span-6
        "
      >
        <div
          class="
            shadow-lg
            border border-white
            p-6
            transition
            duration-500
            ease-in-out
            transform
            hover:translate-x-1 hover:translate-y-1 hover:scale-105
          "
        >
          <div class="rounded-tl rounded-tr relative">
            <h3 class="text-xl text-white pb-1">{{ testim.author_name }}</h3>
            <p v-if="testim.author_company" class="text-base">
              {{ testim.author_company }}
            </p>
            <div
              class="
                h-16
                w-16
                rounded-full
                bg-cover
                border-4 border-white
                absolute
                top-0
                right-0
                -mt-4
                -mr-4
              "
            >
              <img
                v-if="testim.author_image"
                :src="testim.author_image.url"
                :alt="`${testim.author_name} image`"
                width="80"
                height="80"
                class="h-full w-full object-cover rounded-full overflow-hidden"
              />
            </div>
          </div>
          <p class="text-base leading-8 pt-4">
            {{ testim.text }}
          </p>
          <div class="flex justify-end mt-2">
            <QuotesIcon></QuotesIcon>
          </div>
        </div>
      </div>
    </div>
    <div class="pb-8">
      <button
        class="
          py-2
          px-4
          border border-gray-50
          dark:hover:bg-gray-700
          hover:bg-gray-500
          dark:bg-gray-900 dark:text-white dark:border-gray-50
        "
        @click.stop="showAll = !showAll"
      >
        {{ showAll ? 'Show Less' : 'Show More' }}
      </button>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import QuotesIcon from '@/components/icons/QuotesIcon'
import LogoImage from '@/components/icons/LogoImage'
export default Vue.extend({
  name: 'TestimonialsComp',
  components: {
    QuotesIcon,
    LogoImage,
  },
  props: {
    testimonials: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      showAll: false,
    }
  },
  methods: {},
})
</script>

<style scoped></style>
