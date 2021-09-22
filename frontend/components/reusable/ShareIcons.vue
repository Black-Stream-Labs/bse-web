<template>
  <div class="flex items-center pt-4">
    <button
      id="share"
      class="
        cursor-pointer
        px-3
        py-2
        border border-gray-50
        text-white
        dark:border-gray-50
        flex
        items-center
        justify-center
        duration-300
        transform-gpu
        transition-all
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
      :disabled="updatedSocialMedia.length === 0"
      @click.prevent="showIcons"
    >
      <span class="pr-2">Share</span>
      <ShareIcon></ShareIcon>
    </button>
    <div id="shareIcons" ref="shareIcons" class="pl-3 opacity-0 inline-flex">
      <template v-for="(social, id) in updatedSocialMedia">
        <SharedGithub
          v-if="social.title.toLowerCase() === 'github'"
          :key="id"
          :options="shareOptions"
          :social="social"
        >
        </SharedGithub>
        <SharedFacebook
          v-if="social.title.toLowerCase() === 'facebook'"
          :key="id"
          :social="social"
          :options="shareOptions"
        >
        </SharedFacebook>
        <SharedLinkedIn
          v-if="social.title.toLowerCase() === 'linkedin'"
          :key="id"
          :social="social"
          :options="shareOptions"
        >
        </SharedLinkedIn>
        <SharedTwitter
          v-if="social.title.toLowerCase() === 'twitter'"
          :key="id"
          :social="social"
          :options="shareOptions"
        >
        </SharedTwitter>
      </template>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import ShareIcon from '@/components/icons/ShareIcon.vue'

export default Vue.extend({
  name: 'ShareIcons',
  components: {
    ShareIcon,
    SharedGithub: () => import('@/components/reusable/SharedGithub.vue'),
    SharedTwitter: () => import('@/components/reusable/SharedTwitter.vue'),
    SharedFacebook: () => import('@/components/reusable/SharedFacebook.vue'),
    SharedLinkedIn: () => import('@/components/reusable/SharedLinkedIn.vue'),
  },
  props: {
    title: {
      type: String,
      default: null,
    },
    text: {
      type: String,
      default: null,
    },
    url: {
      type: String,
      default: null,
    },
    hashtags: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {}
  },
  computed: {
    shareOptions() {
      return {
        url: this.url,
        title: this.title,
        text: this.text,
        hashtags: this.hashtags,
      }
    },
    socialAccounts() {
      return this.$store.state.socialMediaAccounts
    },
    updatedSocialMedia() {
      if (this.socialAccounts && this.socialAccounts.length > 0) {
        const arr = []
        this.socialAccounts.forEach((el: any) => {
          const e = JSON.stringify(el)
          arr.push(JSON.parse(formatContentImageUrl(e)))
        })
        return arr
      } else {
        return []
      }
    },
  },
  methods: {
    showIcons() {
      const shareIcons = document.querySelector('#shareIcons')
      if (this.$refs.shareIcons.classList.contains('opacity-0')) {
        shareIcons.classList.remove('opacity-0')
        shareIcons.classList.add('opacity-1')
      } else {
        shareIcons.classList.remove('opacity-1')
        shareIcons.classList.add('opacity-0')
      }
    },
  },
})
</script>

<style scoped></style>
