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
import Hero from '@/components/Hero'
import UserContent from '@/components/UserContent'
export default Vue.extend({
  components: {
    Hero,
    UserContent,
  },
  layout: 'DefaultLayout',
  middleware: 'auth',
  computed: {
    ...mapGetters(['loggedInUser']),
  },
})
</script>
