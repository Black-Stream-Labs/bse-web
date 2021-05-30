<template>
  <!-- <b-navbar centered> -->
  <nav>
    <NuxtLink to="/articles"> Articles </NuxtLink>
    <NuxtLink to="/products"> Products </NuxtLink>
    <NuxtLink to="/about-us"> About us </NuxtLink>
    <NuxtLink to="/contact"> Contact </NuxtLink>
    <NuxtLink to="/">
      <img
        src="@/assets/img/strapi-logo-light.svg"
        alt="Strapi Logo"
        class="logo"
        height="85"
        width="85"
      />
    </NuxtLink>
    <template v-if="!isAuthenticated">
      <NuxtLink
        to="/register"
        class="is-primary"
        :class="{ 'is-active': $route.name === 'register' }"
      >
        Sign up
      </NuxtLink>
      <NuxtLink href="/login" class="is-light"> Log in </NuxtLink>
    </template>
    <template v-else>
      <NuxtLink
        to="/profile"
        class="is-primary"
        :class="{ 'is-active': $route.name === 'profile' }"
      >
        My Account &nbsp; &nbsp;
      </NuxtLink>
      <NuxtLink to="/logout" @click="logout"> Log out </NuxtLink>
    </template>
    <SnipcartButton></SnipcartButton>
  </nav>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { mapGetters } from 'vuex'

export default Vue.extend({
  name: 'AppNavbar',
  components: {
    SnipcartButton: () => import('@/components/SnipcartButton'),
  },
  data() {
    return {}
  },
  computed: {
    ...mapGetters({
      isAuthenticated: 'isAuthenticated',
      loggedInUser: 'loggedInUser',
    }),
  },

  methods: {
    async logout() {
      await this.$auth.logout()
    },
  },
})
</script>

<style scoped>
.navbar {
  z-index: 20;
}
</style>
