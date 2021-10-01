<template>
  <div>
    <Hero
      v-if="page"
      :title="page.title"
      :subtitle="page.subtitle"
      :headerimage="updatedHeaderIMage"
    ></Hero>
    <section v-if="updatedMotto" class="section py-24">
      <div class="container max-w-3xl mx-auto px-4 py-10 text-center">
        <div v-html="$md.render(updatedMotto)" />
      </div>
    </section>
    <section class="section">
      <div class="container max-w-5xl mx-auto px-4">
        <div class="grid grid-cols-12 gap-4">
          <div class="col-span-12 sm:col-span-8">
            <ValidationObserver ref="form" v-slot="{ handleSubmit }">
              <form
                class="flex flex-wrap items-start py-8"
                @submit.prevent="handleSubmit(submitForm)"
              >
                <label class="hidden sr-only">
                  Don't fill this is you are human
                  <input
                    v-model="bots"
                    name="bot-field"
                    class="form-input mt-1 block w-full"
                    type="text"
                    placeholder="This field is only for the robots."
                  />
                </label>
                <ValidationProvider
                  v-slot="{ errors }"
                  vid="name"
                  name="Name"
                  rules="required|min:3"
                  class="block w-full lg:w-2/3 pb-5"
                >
                  <label>
                    <span class="text-gray-700 dark:text-white">Name</span>
                    <input
                      id="name"
                      v-model="name"
                      required
                      type="text"
                      class="form-input mt-1 block w-full"
                      placeholder="Your name"
                    />
                    <span class="text-sm text-red-700 italic bold">
                      {{ errors[0] }}
                    </span>
                  </label>
                </ValidationProvider>
                <ValidationProvider
                  v-slot="{ errors }"
                  vid="email"
                  name="Email"
                  :rules="{ required: true, email: true }"
                  class="block w-full lg:w-2/3 pb-5"
                >
                  <label>
                    <span class="text-gray-700 dark:text-white">Email</span>
                    <input
                      v-model="email"
                      required
                      type="email"
                      class="form-input mt-1 block w-full"
                      placeholder="eg: john@example.com"
                    />
                    <span class="text-sm text-red-700 italic bold">
                      {{ errors[0] }}
                    </span>
                  </label>
                </ValidationProvider>
                <label class="block w-full lg:w-2/3 pb-5">
                  <span class="text-gray-700 dark:text-white">Subject</span>
                  <select
                    v-model="subject"
                    class="form-select block w-full mt-1"
                  >
                    <option>Choose an option</option>
                    <option value="School">School</option>
                    <option value="Website">Website</option>
                    <option value="Education">Education</option>
                    <option value="Maths">Maths</option>
                  </select>
                </label>
                <label class="block w-full lg:w-2/3 pb-5">
                  <span class="text-gray-700 dark:text-white">Company</span>
                  <input
                    v-model="company"
                    type="text"
                    class="form-input mt-1 block w-full"
                    placeholder="Your company name"
                  />
                </label>
                <ValidationProvider
                  v-slot="{ errors }"
                  vid="message"
                  name="Message"
                  rules="required|min:10"
                  class="block w-full lg:w-2/3 pb-5"
                >
                  <label>
                    <span class="text-gray-700 dark:text-white">Message</span>
                    <textarea
                      id="message"
                      v-model="content"
                      required
                      name="message"
                      class="form-textarea mt-1 block w-full"
                      rows="5"
                      placeholder="Your message"
                    ></textarea>
                    <span class="text-sm text-red-700 italic bold">
                      {{ errors[0] }}
                    </span>
                  </label>
                </ValidationProvider>
                <div class="w-full">
                  <button
                    type="submit"
                    class="
                      w-1/4
                      py-4
                      border border-gray-100
                      text-gray-100
                      flex
                      place-items-center
                      justify-center
                      dark:bg-gray-700 dark:text-gray-300
                    "
                    :class="
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
                        ? 'bg-gray-700'
                        : 'bg-gray-500'
                    "
                  >
                    Send message
                  </button>
                </div>
              </form>
            </ValidationObserver>
            <div
              v-if="loading"
              class="
                overflow-x-hidden overflow-y-auto
                fixed
                inset-0
                z-50
                outline-none
                focus:outline-none
                justify-center
                items-center
                flex
              "
            >
              <div class="relative w-auto my-6 mx-auto max-w-sm">
                <!--content-->
                <div
                  class="
                    shadow-lg
                    relative
                    flex flex-col
                    w-128
                    bg-white
                    outline-none
                    focus:outline-none
                    px-4
                  "
                >
                  <!--header-->
                  <div
                    class="
                      flex
                      items-start
                      justify-between
                      p-3
                      border-b border-solid border-gray-500
                    "
                  >
                    <h3 class="text-xl font-semibold">Sending your message</h3>
                  </div>
                  <!--body-->
                  <div class="p-6 flex-auto">
                    <p
                      v-if="!success && errored"
                      class="py-4 leading-relaxed"
                      style="color: orangered"
                    >
                      Your message cannot be sent at this time. We are sorry for
                      any incovenience. Please try again later.
                    </p>
                    <p
                      v-if="!errored && success"
                      class="py-4 leading-relaxed text-green-800"
                    >
                      Thank you for your message. We will do our best to get
                      back in touch as soon as possible.
                    </p>
                    <div v-if="!success && !errored" class="spinner">
                      <div
                        class="dot1"
                        :style="
                          $store.state.fullColor
                            ? `background: var(--background-end)`
                            : '#333'
                        "
                      ></div>
                      <div
                        class="dot2"
                        :style="
                          $store.state.fullColor
                            ? `background: var(--background-end)`
                            : '#333'
                        "
                      ></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div
              v-if="loading"
              class="opacity-50 fixed inset-0 z-40 bg-black"
            ></div>
          </div>
          <div
            class="
              hidden
              sm:flex sm:flex-row
              items-end
              justify-end
              sm:col-span-4
            "
          >
            <LogoNotextCircle
              width="600"
              height="600"
              :color="
                $store.state.fullColor ? 'var(--background-end)' : 'white'
              "
            ></LogoNotextCircle>
          </div>
        </div>
      </div>
    </section>
    <section
      v-if="updatedContent"
      class="section"
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
          : ''
      "
    >
      <div
        class="container max-w-5xl mx-auto px-4 py-24 dark:text-white"
        :class="$store.state.fullColor ? 'text-white' : ''"
      >
        <h2 v-if="page.content.subtitle" class="capitalize text-2xl">
          {{ page.content.subtitle }}
        </h2>
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>
    <section v-if="updatedExtraContent" class="section">
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <div v-html="$md.render(updatedExtraContent)"></div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { ValidationProvider, ValidationObserver } from 'vee-validate'
import Hero from '@/components/hero/Hero'
import LogoNotextCircle from '@/components/icons/LogoNotextCircle'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { contact } from '@/apollo/queries/pages/contact.js'

export default Vue.extend({
  name: 'ContactPage',
  components: {
    Hero,
    LogoNotextCircle,
    ValidationProvider,
    ValidationObserver,
  },
  async asyncData({ $strapi }) {
    const data = await $strapi.graphql({ query: contact() })
    return {
      page: data.contact,
    }
  },
  data() {
    return {
      name: '',
      email: '',
      subject: '',
      company: '',
      content: '',
      bots: null,
      errorMessage: null,
      isBot: false,
      loading: false,
      success: false,
      errored: false,
    }
  },
  computed: {
    updatedContent() {
      if (this.page.content) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return null
      }
    },

    updatedMotto() {
      if (this.page.motto) {
        return formatContentImageUrl(this.page.motto)
      } else {
        return null
      }
    },
    updatedExtraContent() {
      if (this.page.extraContent) {
        return formatContentImageUrl(this.page.extraContent)
      } else {
        return null
      }
    },

    updatedHeaderIMage() {
      if (this.page.content && this.page.content.header_image) {
        return this.page.content.header_image.url
      } else {
        return null
      }
    },
    updatedTestimonials() {
      const x = []
      this.testimonials.forEach((el: any) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },
  },
  methods: {
    async submitForm() {
      this.loading = true
      if (this.bots !== null) {
        this.isBot = true
        this.loading = false
        return
      }
      if (!(await this.$refs.form.validate())) {
        this.loading = false
        return false
      }
      await this.$strapi
        .create('messages', {
          name: this.name,
          email: this.email,
          company: this.company,
          subject: this.subject,
          content: this.content,
        })
        .then(() => {
          setTimeout(() => {
            this.success = true
            this.errored = false
            setTimeout(() => {
              requestAnimationFrame(() => {
                this.name = ''
                this.email = ''
                this.company = ''
                this.subject = ''
                this.content = ''
                this.bots = null
                this.isBot = false
                this.loading = false
                this.errorMessage = null
                this.$refs.form.reset()
              })
            }, 1000)
          }, 1000)
        })
        .catch((err: any) => {
          setTimeout(() => {
            this.success = false
            this.errored = true
            this.errorMessage = err
            setTimeout(() => {
              requestAnimationFrame(() => {
                this.bots = null
                this.isBot = false
                this.loading = false
                // this.errorMessage = null
                this.errored = false
                this.$refs.form.reset()
              })
            }, 1500)
          }, 500)
        })
    },
  },
})
</script>

<style scoped lang="postcss">
.column &.is-reversed &:nth-child(odd) {
  order: 2;
}
.column &.is-reversed &:nth-child(even) {
  order: 1;
}
</style>
