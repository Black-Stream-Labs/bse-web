<template>
  <header class="sticky top-0 bg-gray-50 dark:bg-gray-900 dark:text-white">
    <nav
      class="flex justify-between items-center select-none"
      :class="showLogo ? 'py-2 px-4' : 'py-4 px-4'"
      role="navigation"
    >
      <div class="flex lg:hidden">
        <MenuIcon
          v-if="!isOpen"
          :color="dinamicColor"
          @click="isOpen = true"
        ></MenuIcon>

        <CloseIcon
          v-else
          :color="dinamicColor"
          @click="isOpen = false"
        ></CloseIcon>
      </div>
      <div class="sm:flex lg:hidden flex items-center justify-between w-1/2">
        <NuxtLink to="/" class="lg:hidden text-sm">
          <img
            src="@/assets/img/logos/BSE-logo.svg"
            alt="Black Stream Education Logo"
            class="logo"
            height="50"
            width="50"
          />
        </NuxtLink>
        <AccesibilityMenu></AccesibilityMenu>
      </div>
      <!-- Desktop Links -->
      <div
        class="hidden lg:flex align-center justify-between text-sm lg:w-full max-w-5xl mx-auto"
      >
        <NuxtLink
          to="/about-us"
          class="px-2 py-2 hover:bg-gray-400 flex items-center justify-center"
        >
          About us
        </NuxtLink>
        <NuxtLink
          to="/services"
          class="px-2 py-2 hover:bg-gray-400 flex items-center justify-center"
        >
          Services
        </NuxtLink>
        <NuxtLink
          to="/articles"
          class="px-2 py-2 hover:bg-gray-400 flex items-center justify-center"
        >
          Articles
        </NuxtLink>

        <NuxtLink
          to="/events"
          class="px-2 py-2 hover:bg-gray-400 flex items-center justify-center"
        >
          Events
        </NuxtLink>
        <NuxtLink
          to="/safeguarding"
          class="px-2 py-2 hover:bg-gray-400 flex items-center justify-center"
        >
          Safeguarding
        </NuxtLink>

        <NuxtLink
          to="/"
          class="hover:rounded-full hover:bg-gray-400 flex items-center justify-center"
          :class="showLogo ? '' : 'h-0'"
        >
          <!-- <transition name="animate-down"> -->
          <img
            id="desktopLogo"
            src="@/assets/img/logos/BSE-logo.svg"
            alt="Black Stream Education Logo"
            class="logo"
            width="50"
            :style="showLogo ? 'height:50px' : 'height:0px'"
            :class="showLogo ? 'motion-safe:animate-down' : 'opacity-0'"
          />
          <!-- </transition> -->
        </NuxtLink>
        <NuxtLink
          to="/products"
          class="px-2 py-2 hover:bg-gray-400 flex items-center justify-center"
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
      class="bg-gray-50 px-4 py-4 select-none border-b lg:hidden absolute w-full dark:bg-gray-900 dark:text-white"
    >
      <NuxtLink
        to="/about-us"
        class="block font-semibold text-gray-800 py-3 px-3 hover:bg-gray-400 hover:text-gray-50 dark:text-white"
      >
        About us
      </NuxtLink>
      <NuxtLink
        to="/services"
        class="block font-semibold text-gray-800 py-3 px-3 hover:bg-gray-400 hover:text-gray-50 dark:text-white"
      >
        Services
      </NuxtLink>
      <NuxtLink
        to="/articles"
        class="block font-semibold text-gray-800 py-3 px-3 hover:bg-gray-400 hover:text-gray-50 dark:text-white"
      >
        Articles
      </NuxtLink>

      <NuxtLink
        to="/events"
        class="block font-semibold text-gray-800 py-3 px-3 hover:bg-gray-400 hover:text-gray-50 dark:text-white"
      >
        Events
      </NuxtLink>
      <NuxtLink
        to="/safeguarding"
        class="block font-semibold text-gray-800 py-3 px-3 hover:bg-gray-400 hover:text-gray-50 dark:text-white"
      >
        Safeguarding
      </NuxtLink>
      <NuxtLink
        to="/products"
        class="block font-semibold text-gray-800 py-3 px-3 hover:bg-gray-400 hover:text-gray-50 dark:text-white"
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
    AccesibilityMenu: () => import('@/components/AccesibilityMenu'),
  },
  data() {
    return {
      isOpen: false,
      showLogo: false,
      scrollHeight: 0,
      dinamicColor: 'white',
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
      if (newValue === oldValue || newValue < 150) {
        this.showLogo = false
        return
      }
      this.showLogo = true
    },
  },
  mounted() {
    this.checkColor()
    window.addEventListener('load', this.scrollHandler)
    window.addEventListener('scroll', this.scrollHandler)
    this.$root.$on('changeColor', () => {
      this.$nextTick(() => {
        this.checkColor()
      })
    })
  },

  methods: {
    async logout() {
      await this.$auth.logout()
    },
    beforeDestroy() {
      window.addEventListener('load', this.scrollHandler)
      window.addEventListener('scroll', this.scrollHandler)
    },
    scrollHandler() {
      this.scrollHeight = window.scrollY
    },
    checkColor() {
      localStorage.theme === 'light'
        ? (this.dinamicColor = 'indigo')
        : (this.dinamicColor = 'white')
    },
  },
})
</script>

<style>
.navbar {
  z-index: 20;
}
</style>
