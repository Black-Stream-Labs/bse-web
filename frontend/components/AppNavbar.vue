<template>
  <header class="sticky top-0 bg-gray-50 dark:bg-gray-900 dark:text-white">
    <nav
      class="flex justify-between items-center select-none"
      :class="showLogo ? 'py-2 px-4' : 'py-4 px-4'"
      role="navigation"
    >
      <div class="lg:hidden">
        <button v-if="!isOpen" @click="isOpen = true">
          <MenuIcon></MenuIcon>
        </button>

        <button v-else @click="isOpen = false">
          <CloseIcon></CloseIcon>
        </button>
      </div>
      <div class="sm:flex lg:hidden flex items-center justify-between w-1/2">
        <NuxtLink to="/" class="lg:hidden text-sm">
          <LogoImage height="50" width="50"></LogoImage>
        </NuxtLink>
        <AccesibilityMenu></AccesibilityMenu>
      </div>
      <!-- Desktop Links -->
      <div
        class="hidden lg:flex align-center justify-between text-sm lg:w-full max-w-5xl mx-auto"
      >
        <NuxtLink
          to="/about"
          class="p-2 hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
        >
          About us
        </NuxtLink>
        <NuxtLink
          to="/services"
          class="p-2 hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
        >
          Services
        </NuxtLink>
        <NuxtLink
          to="/articles"
          class="p-2 hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
        >
          Articles
        </NuxtLink>

        <NuxtLink
          to="/events"
          class="p-2 hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
        >
          Events
        </NuxtLink>
        <NuxtLink
          to="/safeguarding"
          class="p-2 hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
        >
          Safeguarding
        </NuxtLink>

        <NuxtLink
          to="/"
          class="hover:rounded-full hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
          :class="showLogo ? '' : 'h-0'"
        >
          <transition name="animate-down">
            <LogoImage :height="showLogo ? 60 : 0" width="60"></LogoImage>
          </transition>
        </NuxtLink>
        <NuxtLink
          to="/products"
          class="p-2 hover:bg-gray-300 dark:hover:bg-gray-500 flex items-center justify-center"
        >
          Products
        </NuxtLink>
        <AccesibilityMenu></AccesibilityMenu>
        <SnipcartButton></SnipcartButton>
      </div>
    </nav>

    <!-- Mobile Links -->
    <div
      v-if="isOpen"
      class="bg-gray-50 p-4 select-none border-b lg:hidden absolute w-full dark:bg-gray-900 dark:text-white"
    >
      <NuxtLink
        to="/about"
        class="block font-semibold text-gray-800 p-3 hover:bg-gray-300 dark:hover:bg-gray-500 hover:text-gray-50 dark:text-white"
      >
        About us
      </NuxtLink>
      <NuxtLink
        to="/services"
        class="block font-semibold text-gray-800 p-3 hover:bg-gray-300 dark:hover:bg-gray-500 hover:text-gray-50 dark:text-white"
      >
        Services
      </NuxtLink>
      <NuxtLink
        to="/articles"
        class="block font-semibold text-gray-800 p-3 hover:bg-gray-300 dark:hover:bg-gray-500 hover:text-gray-50 dark:text-white"
      >
        Articles
      </NuxtLink>

      <NuxtLink
        to="/events"
        class="block font-semibold text-gray-800 p-3 hover:bg-gray-300 dark:hover:bg-gray-500 hover:text-gray-50 dark:text-white"
      >
        Events
      </NuxtLink>
      <NuxtLink
        to="/safeguarding"
        class="block font-semibold text-gray-800 p-3 hover:bg-gray-300 dark:hover:bg-gray-500 hover:text-gray-50 dark:text-white"
      >
        Safeguarding
      </NuxtLink>
      <NuxtLink
        to="/products"
        class="block font-semibold text-gray-800 p-3 hover:bg-gray-300 dark:hover:bg-gray-500 hover:text-gray-50 dark:text-white"
      >
        Products
      </NuxtLink>
      <SnipcartButton></SnipcartButton>
    </div>
  </header>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { mapGetters } from 'vuex'

export default Vue.extend({
  name: 'AppNavbar',
  components: {
    SnipcartButton: () => import('@/components/SnipcartButton'),
    MenuIcon: () => import('@/components/icons/MenuIcon'),
    CloseIcon: () => import('@/components/icons/CloseIcon'),
    LogoImage: () => import('@/components/icons/LogoImage'),
    AccesibilityMenu: () => import('@/components/AccesibilityMenu'),
  },

  data() {
    return {
      isOpen: false,
      showLogo: false,
      scrollHeight: 0,
      dinamicColor: 'indigo',
    }
  },
  computed: {
    ...mapGetters({
      isAuthenticated: 'isAuthenticated',
      loggedInUser: 'loggedInUser',
    }),
  },
  watch: {
    scrollHeight(newValue, oldValue) {
      if (
        (newValue && newValue !== 0 && newValue === oldValue) ||
        newValue < 250
      ) {
        this.showLogo = false
        return
      }
      this.showLogo = true
    },
  },
  mounted() {
    window.addEventListener('load', this.scrollHandler)
    window.addEventListener('scroll', this.scrollHandler)
  },

  beforeDestroy() {
    window.removeEventListener('load', this.scrollHandler)
    window.removeEventListener('scroll', this.scrollHandler)
  },
  methods: {
    async logout() {
      await this.$auth.logout()
    },
    scrollHandler() {
      this.scrollHeight = window.scrollY
    },
  },
})
</script>

<style>
.navbar {
  z-index: 20;
}
</style>
