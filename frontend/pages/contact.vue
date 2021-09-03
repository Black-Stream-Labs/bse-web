<template>
  <div>
    <Hero
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
            <div v-if="success" class="rounded text-lg p-4">
              Great! Your message has been sent successfully. I will try to
              respond quickly.
            </div>
            <!-- <FormulateForm
              v-else
              invalid-message="Not all fields were filled out properly"
              class="block w-full"
              @submit="submitForm"
            >
              <FormulateInput
                v-model="bots"
                type="hidden"
                value="Don't fill this is you are human"
                label-class="block w-full lg:w-2/3"
                outer-class="lg:w-2/3 pb-5"
                input-class="hidden sr-only form-input mt-1 block w-full"
              />
              <FormulateInput
                v-model="name"
                type="text"
                name="name"
                label="Your name"
                validation="bail|required|min:3"
                label-class="block w-full lg:w-2/3"
                input-class="form-input  w-full "
                outer-class="lg:w-2/3 pb-5"
                error-class="text-red-700 text-sm mt-1"
              />
              <FormulateInput
                v-model="email"
                type="email"
                name="email"
                label="Your email address"
                validation="bail|required|email"
                label-class="block w-full lg:w-2/3"
                input-class="form-input  w-full "
                outer-class="lg:w-2/3  pb-5"
                error-class="text-red-700 text-sm mt-1"
              />
              <FormulateInput
                v-model="company"
                type="text"
                name="company"
                label="Your company"
                label-class="block w-full lg:w-2/3"
                input-class="form-input  w-full "
                outer-class="lg:w-2/3  pb-5"
                error-class="text-red-700 text-sm mt-1"
              />
              <FormulateInput
                v-model="subject"
                type="select"
                name="subject"
                :options="['School', 'Website', 'Education', 'Maths']"
                placeholder="Select an option"
                label="Select a subject related to your email"
                label-class="block w-full lg:w-2/3"
                input-class="form-select  w-full "
                outer-class="lg:w-2/3  pb-5"
                error-class="text-red-700 text-sm mt-1"
              />
              <FormulateInput
                v-model="content"
                type="textarea"
                name="content"
                label="Your message"
                validation="bail|required|min:10"
                validation-name="content"
                help="Please enter more then 10 characters."
                label-class="block w-full lg:w-2/3"
                input-class="form-textarea w-full "
                rows="5"
                outer-class="lg:w-2/3  pb-5"
                error-class="text-red-700 text-sm mt-1"
              /><FormulateInput
                type="submit"
                outer-class="mt-6"
                :input-class="
                  $store.state.fullColor
                    ? $store.state.fullColor.name === 'tgreen'
                      ? 'w-1/4 py-4 border border-gray-100 text-gray-100 flex place-items-center justify-center dark: bg-gray-700 dark:text-gray-300 bg-tgreen '
                      : $store.state.fullColor.name === 'tpurple'
                      ? 'w-1/4 py-4 border border-gray-100 text-gray-100 flex place-items-center justify-center dark: bg-gray-700 dark:text-gray-300 bg-tpurple '
                      : $store.state.fullColor.name === 'tblue'
                      ? ' w-1/4 py-4 border border-gray-100 text-gray-100 flex place-items-center justify-center dark: bg-gray-700 dark:text-gray-300 bg-tblue'
                      : $store.state.fullColor.name === 'tbrown'
                      ? ' w-1/4 py-4 border border-gray-100 text-gray-100 flex place-items-center justify-center dark: bg-gray-700 dark:text-gray-300 bg-tbrown'
                      : ''
                    : $colorMode.preference === 'dark'
                    ? ' w-1/4 py-4 border border-gray-100 text-gray-100 flex place-items-center justify-center dark: bg-gray-700 dark:text-gray-300 bg-gray-700'
                    : ' w-1/4 py-4 border border-gray-100 text-gray-100 flex place-items-center justify-center dark: bg-gray-700 dark:text-gray-300 bg-gray-500'
                "
              />
            </FormulateForm> -->
            <form
              v-else
              class="flex flex-wrap items-start py-8"
              @submit.prevent="submitForm"
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

              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Name</span>
                <input
                  v-model="name"
                  required
                  type="text"
                  class="form-input mt-1 block w-full"
                  placeholder="your name"
                />
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Email</span>
                <input
                  v-model="email"
                  required
                  type="email"
                  class="form-input mt-1 block w-full"
                  placeholder="john@example.com"
                />
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Subject</span>
                <select v-model="subject" class="form-select block w-full mt-1">
                  <option>Choose an option</option>
                  <option value="School">School</option>
                  <option value="Website">Website</option>
                  <option value="Education">Education</option>
                  <option value="Maths">Maths</option>
                </select>
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Company</span>
                <input
                  v-model="company"
                  type="text"
                  class="form-input mt-1 block w-full"
                  placeholder="Your company name"
                />
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Message</span>
                <textarea
                  v-model="content"
                  required
                  class="form-textarea mt-1 block w-full"
                  rows="5"
                  placeholder="Your message"
                ></textarea>
              </label>
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
            <LogoImage
              width="600"
              height="600"
              :color="
                $store.state.fullColor ? 'var(--background-end)' : 'white'
              "
            ></LogoImage>
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
import Hero from '@/components/Hero'
import LogoImage from '@/components/icons/LogoImage'

import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { contact } from '@/apollo/queries/pages/contact.js'

export default Vue.extend({
  name: 'ContactPage',
  components: {
    Hero,
    LogoImage,
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

      await this.$strapi
        .create('messages', {
          name: this.name,
          email: this.email,
          company: this.company,
          subject: this.subject,
          content: this.content,
        })
        .then((res: any) => {
          console.log('response from server', res)
          setTimeout(() => {
            this.name = ''
            this.email = ''
            this.company = ''
            this.subject = ''
            this.content = ''
            this.bots = null
            this.isBot = false
            this.loading = false
            this.success = true
            this.errored = false
          }, 350)
        })
        .catch((err: any) => {
          setTimeout(() => {
            this.success = false
            this.errored = true
            this.errorMessage = err
            this.isBot = false
            this.bots = null
            this.loading = false
          }, 350)
        })
      // .finally(() => {
      //   setTimeout(() => {
      //     this.isBot = false
      //     this.bots = null
      //     this.loading = false
      //   }, 350)
      // })
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
