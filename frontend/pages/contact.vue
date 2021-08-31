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
            <form
              action="#"
              method="POST"
              class="flex flex-wrap items-start py-8"
            >
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Name</span>
                <input
                  type="text"
                  class="form-input mt-1 block w-full"
                  placeholder="your name"
                />
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Email</span>
                <input
                  type="email"
                  class="form-input mt-1 block w-full"
                  placeholder="john@example.com"
                />
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Subject</span>
                <select class="form-select block w-full mt-1">
                  <option>Choose here</option>
                  <option value="School">School</option>
                  <option value="Website">Website</option>
                  <option value="Education">Education</option>
                  <option value="Maths">Maths</option>
                </select>
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Company</span>
                <input
                  type="text"
                  class="form-input mt-1 block w-full"
                  placeholder="Your company name"
                />
              </label>
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700">Message</span>
                <textarea
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
                  @click.prevent="sendEmail"
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
    sendEmail() {
      console.log('sending emails')
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
