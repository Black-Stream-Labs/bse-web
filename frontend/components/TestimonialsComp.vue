<template>
  <div class="text-white flex flex-row flex-wrap">
    <div class="hidden md:block w-1/3 p-4 text-right">
      <LogoImage width="150" height="150"></LogoImage>
    </div>
    <div
      id="carousel"
      ref="carousel"
      class="md:w-2/3 grid grid-cols-12 gap-2"
      :class="showAll ? '' : 'overflow-hidden max-h-96'"
    >
      <div
        v-for="(testim, ind) in testimonials"
        :key="ind"
        class="
          py-5
          figure
          flex flex-wrap flex-col
          justify-around
          col-span-12
          md:col-span-6
        "
      >
        <div class="shadow-lg mx-3 xl:mx-3 sm:mx-0 lg:mx-0 border border-white">
          <div class="pt-6 pb-6 pl-6 rounded-tl rounded-tr">
            <p class="text-xl text-white pb-1">{{ testim.author_name }}</p>
            <p v-if="testim.author_company" class="text-base">
              {{ testim.author_company }}
            </p>
          </div>
          <div class="pl-6 pr-6 pt-10 relative h-64">
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
                -mt-8
                mr-6
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

            <p class="text-base leading-8 line-clamp-5">
              {{ testim.text }}
            </p>
            <div class="flex justify-end mt-2">
              <QuotesIcon></QuotesIcon>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div
      class="
        cursor-pointer
        flex
        w-full
        pt-4
        pb-8
        sm:pt-8
        md:pt-8
        lg:pt-8
        xl:pt-12
      "
    >
      <button @click.stop="showAll = !showAll">
        {{ showAll ? 'Less' : 'More' }}
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
