<template>
  <div class="text-white flex flex-row flex-wrap">
    <div class="hidden md:block w-1/4 p-4 text-right">
      <LogoImage width="150" height="150"></LogoImage>
    </div>
    <div
      id="teamcarousel"
      ref="teamcarousel"
      class="md:w-3/4 masonry"
      :class="showAll ? '' : 'overflow-hidden max-h-128'"
    >
      <div
        v-for="(team, ind) in teamMembers"
        :key="ind"
        class="
          p-2
          break-inside
          flex flex-wrap flex-col
          justify-around
          col-span-12
          md:col-span-6
        "
      >
        <div class="shadow-lg border border-white p-6">
          <div class="rounded-tl rounded-tr relative">
            <div class="h-48 w-48 rounded-full bg-cover border-4 border-white">
              <img
                v-if="team.member_image"
                :src="`/api/v1${team.member_image.url}`"
                :alt="`${team.member_name} image`"
                class="h-full w-full object-cover rounded-full overflow-hidden"
              />
            </div>
            <h3 class="text-xl text-right text-white pb-1">
              {{ team.member_name }}
            </h3>
          </div>
          <div
            class="text-base leading-8 pt-4"
            v-html="$md.render(team.member_description)"
          ></div>
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
  name: 'OurTeam',
  components: {
    QuotesIcon,
    LogoImage,
  },
  props: {
    teamMembers: {
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
