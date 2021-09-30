<template>
  <footer
    class="pt-28 pb-10 px-4 w-full text-gray-50 bg-gray-800 flex flex-col"
  >
    <div
      v-if="domainExperts && domainExperts.length > 0"
      class="
        flex
        content-center
        items-center
        justify-items-center
        max-w-5xl
        mx-auto
        w-full
        flex-grow
      "
    >
      <a
        v-for="(expert, id) in updatedExperts"
        :key="id"
        :href="expert.URL"
        class="
          text-white
          hover:text-white
          border-transparent
          flex
          m-2
          p-3
          hover:cursor-pointer
        "
      >
        <img
          class="text-white min-h-14"
          :src="expert.image.url"
          width="160"
          loading="lazy"
          :alt="`${expert.title} logo`"
        />
      </a>
    </div>
    <div class="md:flex justify-between max-w-5xl mx-auto w-full flex-grow">
      <div class="mb-4 md:mb-0">
        <ul>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/about"
            >
              About Us
            </NuxtLink>
          </li>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/services"
            >
              Our Services
            </NuxtLink>
          </li>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/products"
            >
              Our Shop
            </NuxtLink>
          </li>
        </ul>
      </div>
      <div class="mb-4 md:mb-0">
        <ul>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/privacy-policies"
            >
              Privacy Policies
            </NuxtLink>
          </li>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/terms-conditions"
            >
              Terms and Conditions
            </NuxtLink>
          </li>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/faq"
            >
              FAQs
            </NuxtLink>
          </li>
        </ul>
      </div>
      <div class="mb-4 md:mb-0">
        <ul>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/cookie-policy"
            >
              Cookie Policies
            </NuxtLink>
          </li>
          <li class="py-2">
            <NuxtLink
              class="p-3 border rounded border-transparent hover:border-white"
              to="/contact"
            >
              Contact Us
            </NuxtLink>
          </li>
        </ul>
      </div>

      <div
        v-if="socialAccounts && socialAccounts.length > 0"
        class="flex justify-center flex-col items-center"
      >
        <a
          v-for="(social, id) in updatedSocialMedia"
          :key="id"
          :href="social.URL"
          class="
            text-white
            hover:text-white
            border
            rounded-full
            border-transparent
            m-2
            p-3
            inline-flex
            hover:border-white
          "
        >
          <img
            class="text-white"
            :src="social.image.url"
            height="40"
            width="40"
            loading="lazy"
            :alt="`${social.title} logo`"
          />
        </a>
      </div>
    </div>
    <div
      class="
        flex flex-col
        sm:flex-row
        items-center
        justify-center
        w-full
        max-w-5xl
        mx-auto
        flex-grow-0
        pt-10
        text-sm
      "
    >
      Designed and built with

      <a
        href="https://strapi.com"
        target="_blank"
        rel="noopener"
        title="Strapi"
        class="m-2 p-2 border rounded border-transparent hover:border-white"
      >
        <StrapiLogo width="60"></StrapiLogo>
      </a>
      <span> by </span>
      <a
        href="https://threebros.design"
        target="_blank"
        rel="noopener"
        title="ThreeBros Design"
        class="m-2 p-2 border rounded border-transparent hover:border-white"
      >
        <ThreeBros width="100"></ThreeBros>
      </a>
    </div>
  </footer>
</template>
<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { socialMediaQuery } from '@/apollo/queries/social/socialMedia.js'
import { domainExpertsQuery } from '@/apollo/queries/social/domainExperts.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'

import ThreeBros from '@/components/icons/ThreeBros.vue'
import StrapiLogo from '@/components/icons/StrapiLogo.vue'
export default Vue.extend({
  name: 'AppFooter',
  components: {
    ThreeBros,
    StrapiLogo,
  },
  data() {
    return {
      socialAccounts: [],
      domainExperts: [],
    }
  },
  async fetch() {
    const socialAccounts =
      this.$store.state.socialMediaAccounts.length > 0
        ? this.$store.state.socialMediaAccounts
        : await this.$strapi.graphql({ query: socialMediaQuery() })
    const domainExperts =
      this.$store.state.domainExperts.length > 0
        ? this.$store.state.domainExperts
        : await this.$strapi.graphql({ query: domainExpertsQuery() })

    this.socialAccounts = socialAccounts.socialMediaAccounts
    this.domainExperts = domainExperts.domainExperts
  },
  computed: {
    updatedSocialMedia() {
      if (this.socialAccounts.length > 0) {
        const arr = []
        this.socialAccounts.forEach((el: any) => {
          const e = JSON.stringify(el)
          arr.push(JSON.parse(formatContentImageUrl(e)))
        })
        return arr
      } else {
        return []
      }
    },
    updatedExperts() {
      if (this.domainExperts.length > 0) {
        const arr = []
        this.domainExperts.forEach((el: any) => {
          const e = JSON.stringify(el)
          arr.push(JSON.parse(formatContentImageUrl(e)))
        })
        return arr
      } else {
        return []
      }
    },
  },
  mounted() {
    this.$store.dispatch('setSocialMediaAccounts', this.socialAccounts)
    this.$store.dispatch('setDomainExperts', this.domainExperts)
  },
})
</script>

<style scoped></style>
