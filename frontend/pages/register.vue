<template>
  <main class="main-container">
    <Hero
      title="Register for a new account"
      subtitle="To benefit from all the features that we have to offer"
    ></Hero>
    <section class="section">
      <div class="container">
        <div class="columns is-mobile is-centered">
          <div class="column is-6">
            <Notification v-if="success" type="success" :message="success" />
            <Notification v-if="error" type="danger" :message="error" />

            <form v-if="!success" method="post" @submit.prevent="register">
              <div class="field">
                <label class="label">Username</label>
                <div class="control">
                  <input
                    v-model="username"
                    type="text"
                    class="input"
                    name="username"
                    required
                  />
                </div>
              </div>
              <div class="field">
                <label class="label">Email</label>
                <div class="control">
                  <input
                    v-model="email"
                    type="email"
                    class="input"
                    name="email"
                    required
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
                    required
                  />
                </div>
              </div>
              <div class="control">
                <button type="submit" class="button is-dark is-fullwidth">
                  Register
                </button>
              </div>
            </form>

            <div class="" style="margin-top: 20px">
              Already got an account? <nuxt-link to="/login">Login</nuxt-link>
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
  layout: 'DefaultLayout',
  data() {
    return {
      username: '',
      email: '',
      password: '',
      success: null,
      error: null,
    }
  },
  methods: {
    async register() {
      this.error = null
      try {
        this.$axios.setToken(false)
        await this.$axios.post('auth/local/register', {
          username: this.username,
          email: this.email,
          password: this.password,
        })
        this.success = `A confirmation link has been sent to your email account. \
        Please click on the link to complete the registration process.`
      } catch (e) {
        this.error = e.response.data.message[0].messages[0].message
      }
    },
  },
})
</script>
