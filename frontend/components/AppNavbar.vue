<template>
  <b-navbar centered>
    <!-- <b-navbar fixed-top centered shadow> -->
    <template slot="brand">
      <b-navbar-item tag="router-link" :to="{ path: '/' }">
        <img
          src="@/assets/img/strapi-logo-light.svg"
          alt="Strapi Logo"
          class="logo"
          height="85"
          width="85"
        />
      </b-navbar-item>
    </template>
    <template slot="start">
      <b-navbar-item
        tag="router-link"
        :to="{ path: '/articles' }"
        :active="$route.name === 'articles'"
        :class="{ 'is-active': $route.params.slug === 'articles' }"
      >
        Articles
      </b-navbar-item>
      <b-navbar-item
        tag="router-link"
        :to="{ path: '/products' }"
        :active="$route.name === 'products'"
        :class="{ 'is-active': $route.name === 'products' }"
      >
        Products
      </b-navbar-item>
      <b-navbar-item
        tag="router-link"
        :to="{ path: '/about' }"
        :active="$route.params.slug === 'about'"
        :class="{ 'is-active': $route.params.slug === 'about' }"
      >
        About us
      </b-navbar-item>
      <b-navbar-item
        tag="router-link"
        :to="{ path: '/contact' }"
        :active="$route.params.slug === 'contact'"
        :class="{ 'is-active': $route.params.slug === 'contact' }"
      >
        Contact
      </b-navbar-item>
    </template>
    <template slot="end">
      <client-only>
        <template v-if="!isAuthenticated">
          <b-navbar-item
            href="/register"
            class="is-primary"
            :class="{ 'is-active': $route.name === 'register' }"
          >
            Sign up
          </b-navbar-item>
          <b-navbar-item href="/login" class="is-light"> Log in </b-navbar-item>
        </template>
        <template v-if="isAuthenticated">
          <b-navbar-item
            href="/profile"
            class="is-primary"
            :class="{ 'is-active': $route.name === 'profile' }"
          >
            My Account &nbsp; &nbsp;
            <b-icon icon="account"></b-icon>
          </b-navbar-item>
          <b-navbar-item @click="logout"> Log out </b-navbar-item>
        </template>
      </client-only>
      <!-- <SnipcartButton></SnipcartButton> -->
    </template>
  </b-navbar>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { mapGetters } from 'vuex'

export default Vue.extend({
  name: 'AppNavbar',
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

<style scoped lang="scss">
.navbar {
  z-index: initial;
}
</style>
