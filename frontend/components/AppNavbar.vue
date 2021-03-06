<template>
  <header
    class="sticky top-0 dark:bg-gray-900 dark:text-white z-50"
    :class="$store.state.fullColor ? 'text-white' : 'text-gray-800'"
    :style="
      $store.state.fullColor
        ? `background: linear-gradient(270deg, var(--background-start) 0%, var(--background-end) 100%)`
        : null
    "
  >
    <nav
      class="flex justify-between items-center select-none"
      :class="'py-4 px-4'"
      role="navigation"
    >
      <!-- :class="showLogo ? 'py-2 px-4' : 'py-4 px-4'" -->
      <div class="lg:hidden">
        <button v-if="!isOpen" @click="isOpen = true">
          <MenuIcon></MenuIcon>
        </button>

        <button v-else @click="isOpen = false">
          <CloseIcon></CloseIcon>
        </button>
      </div>
      <NuxtLink to="/" class="lg:hidden text-sm ml-16" title="HomePage">
        <LogoNotextCircle height="50" width="50"></LogoNotextCircle>
      </NuxtLink>
      <AccesibilityMenu
        class="lg:hidden text-sm ml-6"
        :color="$store.state.fullColor ? 'white' : 'black'"
      >
      </AccesibilityMenu>
      <!-- Desktop Links -->
      <div
        class="
          hidden
          lg:flex
          items-center
          justify-between
          text-sm
          lg:w-full
          max-w-5xl
          mx-auto
        "
      >
        <NuxtLink
          to="/about"
          class="
            p-2
            hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="About us"
        >
          About us
        </NuxtLink>
        <NuxtLink
          to="/services"
          class="
            p-2
            hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="Services"
        >
          Services
        </NuxtLink>
        <NuxtLink
          to="/articles"
          class="
            p-2
            hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="Articles"
        >
          Articles
        </NuxtLink>

        <NuxtLink
          to="/events"
          class="
            p-2
            hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="Events"
        >
          Events
        </NuxtLink>
        <NuxtLink
          to="/safeguarding"
          class="
            p-2
            hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="Safeguarding"
        >
          Safeguarding
        </NuxtLink>

        <NuxtLink
          to="/"
          class="
            p-2
            hover:rounded-full hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="Homepage"
        >
          <!-- <transition name="animate-down"> -->
          <LogoNotextCircle height="60" width="65"></LogoNotextCircle>
          <!-- </transition> -->
        </NuxtLink>
        <NuxtLink
          to="/shop"
          class="
            p-2
            hover:bg-gray-400
            dark:hover:bg-gray-700
            flex
            items-center
            justify-center
          "
          title="Shop"
        >
          Shop
        </NuxtLink>
        <SnipcartButton></SnipcartButton>
        <AccesibilityMenu></AccesibilityMenu>
      </div>
    </nav>

    <!-- Mobile Links -->
    <ul
      v-if="isOpen"
      class="
        bg-gray-50
        p-4
        select-none
        border-b
        lg:hidden
        absolute
        w-full
        dark:bg-gray-900 dark:text-white
      "
    >
      <li @click="$root.$emit('closeNavigation')">
        <NuxtLink
          to="/about"
          class="
            block
            font-semibold
            text-gray-800
            p-3
            hover:bg-gray-400
            dark:hover:bg-gray-700
            hover:text-gray-50
            dark:text-white
          "
          title="About us"
        >
          About us
        </NuxtLink>
      </li>
      <li @click="$root.$emit('closeNavigation')">
        <NuxtLink
          to="/services"
          class="
            block
            font-semibold
            text-gray-800
            p-3
            hover:bg-gray-400
            dark:hover:bg-gray-700
            hover:text-gray-50
            dark:text-white
          "
          title="Services"
        >
          Services
        </NuxtLink>
      </li>
      <NuxtLink
        to="/articles"
        class="
          block
          font-semibold
          text-gray-800
          p-3
          hover:bg-gray-400
          dark:hover:bg-gray-700
          hover:text-gray-50
          dark:text-white
        "
        title="Articles"
      >
        Articles
      </NuxtLink>
      <li @click="$root.$emit('closeNavigation')">
        <NuxtLink
          to="/events"
          class="
            block
            font-semibold
            text-gray-800
            p-3
            hover:bg-gray-400
            dark:hover:bg-gray-700
            hover:text-gray-50
            dark:text-white
          "
          title="Events"
        >
          Events
        </NuxtLink>
      </li>
      <li @click="$root.$emit('closeNavigation')">
        <NuxtLink
          to="/safeguarding"
          class="
            block
            font-semibold
            text-gray-800
            p-3
            hover:bg-gray-400
            dark:hover:bg-gray-700
            hover:text-gray-50
            dark:text-white
          "
          title="Safeguarding"
        >
          Safeguarding
        </NuxtLink>
      </li>
      <li @click="$root.$emit('closeNavigation')">
        <NuxtLink
          to="/shop"
          class="
            block
            font-semibold
            text-gray-800
            p-3
            hover:bg-gray-400
            dark:hover:bg-gray-700
            hover:text-gray-50
            dark:text-white
          "
          title="Shop"
        >
          Shop
        </NuxtLink>
      </li>
      <SnipcartButton></SnipcartButton>
    </ul>
  </header>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { mapGetters } from 'vuex'
import LogoNotextCircle from '@/components/icons/LogoNotextCircle'
export default Vue.extend({
  name: 'AppNavbar',
  components: {
    SnipcartButton: () => import('@/components/SnipcartButton'),
    MenuIcon: () => import('@/components/icons/MenuIcon'),
    CloseIcon: () => import('@/components/icons/CloseIcon'),
    LogoNotextCircle,
    AccesibilityMenu: () =>
      import('@/components/accessibility/AccesibilityMenu'),
  },

  data() {
    return {
      isOpen: false,
      // showLogo: false,
      // scrollHeight: 0,
    }
  },
  computed: {
    ...mapGetters({
      isAuthenticated: 'isAuthenticated',
      loggedInUser: 'loggedInUser',
    }),
  },
  watch: {
    // scrollHeight(newValue, oldValue) {
    //   if (
    //     (newValue && newValue !== 0 && newValue === oldValue) ||
    //     newValue < 250
    //   ) {
    //     this.showLogo = false
    //     return
    //   }
    //   this.showLogo = true
    // },
  },
  mounted() {
    this.$root.$on('closeNavigation', () => {
      this.$nextTick(() => {
        if (this.isOpen) {
          this.isOpen = false
        }
      })
    })
    // window.addEventListener('load', this.scrollHandler)
    // window.addEventListener('scroll', this.scrollHandler)
  },

  beforeDestroy() {
    // window.removeEventListener('load', this.scrollHandler)
    // window.removeEventListener('scroll', this.scrollHandler)
  },
  methods: {
    async logout() {
      await this.$auth.logout()
    },
    // scrollHandler() {
    // this.scrollHeight = window.scrollY
    // },
  },
})
</script>

<style>
.navbar {
  z-index: 20;
}
</style>
