<template>
  <main class="main-container">
    <Hero
      v-if="page"
      title="Login into your account"
      subtitle="to view and edit your preferences and details"
    ></Hero>
    <section class="section">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6">
            <Notification v-if="error" type="danger" :message="error" />
            <form method="post" @submit.prevent="login">
              <div class="field">
                <label class="label">Email</label>
                <div class="control">
                  <input
                    v-model="email"
                    type="email"
                    class="input"
                    name="email"
                  />
                </div>
              </div>
              <div class="field">
                <label class="label">Password</label>
                <div class="control">
                  <input
                    v-model="password"
                    type="password"
                    class="input"
                    name="password"
                  />
                </div>
              </div>
              <div class="control">
                <button type="submit" class="button is-dark">Log In</button>
              </div>
            </form>
            <div class="mt-4">
              <p>
                Don't have an account?
                <nuxt-link to="/register">Register</nuxt-link>
              </p>
              <p>
                <nuxt-link to="/forgot-password">Forgot Password?</nuxt-link>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
export default Vue.extend({
  middleware: 'guest',

  data() {
    return {
      email: '',
      password: '',
      error: null,
    }
  },
  methods: {
    async login() {
      this.error = null
      try {
        await this.$auth.loginWith('local', {
          data: {
            identifier: this.email,
            password: this.password,
          },
        })
        this.$router.push('/profile')
      } catch (e) {
        this.error = e.response.data.message[0].messages[0].message
      }
    },
  },
})
</script>
