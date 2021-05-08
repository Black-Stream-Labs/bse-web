<template>
  <main class="main-container">
    <Hero
      :title="`Welcome to your account`"
      :subtitle="loggedInUser.username"
      size="is-medium"
    ></Hero>
    <section class="section">
      <div class="container">
        <UserContent :user="loggedInUser"></UserContent>
      </div>
    </section>
  </main>
</template>

<script lang="ts">
// @ts-nocheck
import { mapGetters } from 'vuex'
import Vue from 'vue'
export default Vue.extend({
  layout: 'DefaultLayout',
  middleware: 'auth',
  computed: {
    ...mapGetters(['loggedInUser']),
  },
})
</script>
