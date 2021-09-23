<template>
  <div class="text-white flex flex-row flex-wrap">
    <div
      id="teamcarousel"
      ref="teamcarousel"
      class="
        grid grid-cols-12
        gap-8
        transition-height
        duration-300
        ease-in-out
        transform-gpu
      "
      :class="showAll ? 'max-h-full' : 'overflow-hidden max-h-128'"
    >
      <div
        v-for="(team, ind) in teamMembers"
        :key="ind"
        class="
          col-span-12
          sm:col-span-6
          lg:col-span-4
          flex flex-wrap flex-col
          justify-around
          shadow-lg
          border border-white
          p-4
          transition
          duration-500
          ease-in-out
          transform-gpu
          hover:translate-x-1 hover:translate-y-1 hover:scale-105
        "
      >
        <div class="rounded-tl rounded-tr">
          <div class="h-48 w-48 rounded-full bg-cover border-4 border-white">
            <img
              v-if="team.member_image"
              loading="lazy"
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
          class="
            text-base
            leading-8
            pt-4
            pr-3
            max-h-56
            overflow-y-scroll
            scrollbar
            scrollbar-thin
            scrollbar-track-white
            scrollbar-thumb-gray-400
          "
          v-html="$md.render(team.member_description)"
        ></div>
      </div>
    </div>
    <div class="py-8">
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
export default Vue.extend({
  name: 'OurTeam',
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
