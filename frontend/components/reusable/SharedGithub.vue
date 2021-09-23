<template>
  <SGithub :share-options="shareOptions">
    <span
      class="
        text-white
        hover:text-white
        border
        rounded-full
        border-transparent
        m-2
        p-3
        hover:border-white
        flex
        items-center
        justify-center
        h-12
        w-12
      "
      :class="[
        $store.state.fullColor
          ? $store.state.fullColor.name === 'tgreen'
            ? 'bg-tgreen '
            : $store.state.fullColor.name === 'tpurple'
            ? 'bg-tpurple'
            : $store.state.fullColor.name === 'tblue'
            ? 'bg-tblue'
            : $store.state.fullColor.name === 'tbrown'
            ? 'bg-tbrown'
            : ''
          : $colorMode.preference === 'dark'
          ? 'hover:bg-gray-700'
          : 'hover:bg-gray-500',
      ]"
    >
      <img
        class="text-white"
        :src="social.image.url"
        height="40"
        width="40"
        loading="lazy"
        :alt="`${social.title} logo`"
      />
    </span>
  </SGithub>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'

import { SGithub } from 'vue-socials'
export default Vue.extend({
  name: 'SharedGithub',
  components: {
    SGithub,
  },
  props: {
    options: {
      type: Object,
      default: () => {},
    },
    social: {
      type: Object,
      default: () => {},
    },
  },
  computed: {
    shareOptions() {
      return { username: 'JohnMica', type: 'profile' }
    },
  },
})
</script>

<style scoped></style>
