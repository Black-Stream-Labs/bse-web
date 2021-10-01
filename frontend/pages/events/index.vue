<template>
  <div>
    <HeroEventsComponent
      v-if="page"
      :title="page.title"
      :subtitle="page.subtitle"
    ></HeroEventsComponent>
    <section v-if="updatedMotto" class="section py-24">
      <div class="container max-w-3xl mx-auto px-4 py-10 text-center">
        <div v-html="$md.render(updatedMotto)" />
      </div>
    </section>
    <section class="section">
      <div v-if="updatedEvents" class="container max-w-5xl mx-auto px-4">
        <div class="grid grid-cols-12">
          <form
            class="
              col-span-12
              sm:col-span-6
              md:col-span-5
              lg:col-span-4
              flex flex-wrap
              items-end
              my-2
            "
            @submit.prevent="updateEventsQuery('q', searchTerm)"
          >
            <label class="block dark:text-white">
              Event name
              <input
                v-model="searchTerm"
                class="
                  form-input
                  block
                  pl-4
                  pr-10
                  py-3
                  w-full
                  focus:outline-none focus:shadow-outline
                  text-gray-700
                "
                placeholder="Enter Event Name"
              />
            </label>
            <button
              class="
                py-3
                px-3
                border border-gray-500
                text-gray-100
                flex
                place-items-center
                justify-center
                dark:bg-gray-600 dark:text-gray-300
              "
              :disabled="
                searchTerm === null || (searchTerm && searchTerm.length < 3)
              "
              :class="[
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
                  : 'bg-gray-500',
                searchTerm && searchTerm.length >= 3
                  ? 'cursor-pointer'
                  : 'cursor-not-allowed',
              ]"
              type="submit"
            >
              <svg
                class="fill-current dark:bg-gray-700 dark:text-gray-300 h-6"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
              >
                <path
                  d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"
                />
              </svg>
            </button>
          </form>
          <DatePicker class="col-span-12 sm:col-span-6 md:col-span-5 my-2" />
          <div
            v-if="
              $route.query &&
              ($route.query.d || $route.query.q || $route.query.e)
            "
            class="
              col-span-12
              sm:col-span-6
              md:col-span-2
              my-2
              flex flex-wrap
              items-end
            "
          >
            <a
              href="#"
              class="
                inline-flex
                items-center
                w-max
                py-3
                px-3
                capitalize
                border border-gray-400
                text-white
                dark:border-gray-50
              "
              aria-label="Go Back to Product Summary including the Search Terms and Filters"
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
              @click.prevent="clearQuery"
            >
              <span class="px-4"> clear search </span>
            </a>
          </div>
        </div>
        <div class="grid grid-cols-12 gap-4 py-5">
          <!-- events -->
          <div
            v-for="(event, id) in updatedEvents"
            :key="`event-${id}`"
            class="
              pb-4
              border
              col-span-12
              sm:col-span-6
              md:col-span-4
              lg:col-span-3
              h-full
              flex flex-col
              duration-500
              ease-in-out
              transform
              transition-gpu
              hover:scale-105
              shadow-md
              hover:shadow-lg
            "
          >
            <!-- <div class="flex-2">
              <img
                v-if="event.header_image"
                :src="event.header_image.url"
                class=""
                :alt="`${event.title} image`"
                height="150"
              />
              <img v-else src="" class="" alt="" />
            </div> -->
            <div class="h-full p-2">
              <h5 class="text-xl font-semibold mb-2">
                <NuxtLink
                  class="hover:underline capitalize"
                  :to="`/events/${event.slug}`"
                >
                  {{ event.title }}
                </NuxtLink>
              </h5>
              <div class="flex flex-col pb-8">
                <span class="text-xs font-bold italic dark:text-gray-200">
                  Start time -
                  <time
                    :datetime="
                      new Date(event.start_date).toLocaleDateString('en-GB', {
                        day: 'numeric',
                        year: 'numeric',
                        month: 'short',
                      })
                    "
                  >
                    {{
                      new Date(event.start_date).toLocaleDateString('en-GB', {
                        day: 'numeric',
                        year: 'numeric',
                        month: 'short',
                      })
                    }}
                  </time>
                </span>
                <span>
                  <span class="text-xs font-bold italic dark:text-gray-200">
                    End time -
                    <time
                      :datetime="
                        new Date(event.end_date).toLocaleDateString('en-GB', {
                          day: 'numeric',
                          year: 'numeric',
                          month: 'short',
                        })
                      "
                    >
                      {{
                        new Date(event.end_date).toLocaleDateString('en-GB', {
                          day: 'numeric',
                          year: 'numeric',
                          month: 'short',
                        })
                      }}
                    </time>
                  </span>
                </span>
              </div>
              <div
                class="mb-4 line-clamp-6"
                v-html="$md.render(event.description)"
              ></div>
              <div class="flex justify-between pt-4 items-center">
                <button
                  class="
                    text-xs
                    capitalize
                    font-light
                    border border-gray-400
                    p-1
                    dark:bg-gray-500 dark:text-white dark:border-gray-50
                  "
                  :style="
                    $store.state.fullColor
                      ? 'background:var(--background-start)'
                      : ''
                  "
                  @click.stop="updateEventsQuery('e', event.event_type)"
                >
                  {{ event.event_type }}
                </button>
                <NuxtLink
                  class="
                    px-3
                    py-2
                    text-sm
                    border border-gray-400
                    dark:bg-gray-800 dark:text-white dark:border-gray-50
                  "
                  :class="$store.state.fullColor ? 'text-white' : ''"
                  :style="
                    $store.state.fullColor
                      ? `background:  var(--background-end)`
                      : ''
                  "
                  :to="`/events/${event.slug}`"
                >
                  Event details
                </NuxtLink>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-else class="container max-w-5xl mx-auto px-4">
        <ValidationObserver ref="form" v-slot="{ handleSubmit }">
          <form @submit.prevent="handleSubmit(subscribeUser)">
            <ValidationProvider
              v-slot="{ errors }"
              vid="email"
              name="Email"
              :rules="{ required: true, email: true }"
              class="block w-full lg:w-2/3 pb-5"
            >
              <label class="block w-full lg:w-2/3 pb-5">
                <span class="text-gray-700 dark:text-white"
                  >Subscribe to our newsletter</span
                >
                <input
                  id="email"
                  v-model="subscriberEmail"
                  type="text"
                  placeholder="Email"
                  class="form-input mt-1 block w-full"
                />
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
                :disabled="subscriberEmail === null"
                :class="[
                  subscriberEmail === null
                    ? 'cursor-not-allowed'
                    : 'cursor-pointer',
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
                    : 'bg-gray-500',
                ]"
              >
                Subscribe
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
                <h3 class="text-xl font-semibold">Subscribing</h3>
              </div>
              <!--body-->
              <div class="p-6 flex-auto">
                <p
                  v-if="!success && errored"
                  class="py-4 leading-relaxed"
                  style="color: orangered"
                >
                  Your email is already subscribed to our newsletter. You cannot
                  resubscribe using the same email.
                </p>
                <p
                  v-if="!errored && success"
                  class="py-4 leading-relaxed text-green-800"
                >
                  Thank you for subscribing to our newsletter. Your subscription
                  is now active.
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
    </section>
    <section v-if="updatedContent" class="section">
      <!-- <section
      v-if="updatedContent"
      class="section"
      :style="
        $store.state.fullColor
          ? `background: linear-gradient(270deg, var(--background-end) 0%, var(--background-start) 100%)`
          : ''
      "
    > -->
      <div
        class="container max-w-5xl mx-auto px-4 py-10 dark:text-white"
        :class="$store.state.fullColor ? '' : ''"
      >
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>

    <section
      v-if="sectionUpdated && sectionUpdated.length > 0"
      id="whatwedo"
      class="section"
    >
      <div class="container max-w-5xl mx-auto px-4 py-10">
        <h2>What we do</h2>
        <div class="grid gap-4" :class="`grid-rows-${sectionUpdated.length}`">
          <div
            v-for="(section, ind) in sectionUpdated"
            :key="ind"
            class="row-span-1 py-5"
          >
            <div class="grid grid-cols-12">
              <div
                class="
                  col-span-12
                  transition
                  duration-500
                  ease-in-out
                  transform-gpu
                  hover:translate-x-1 hover:translate-y-1 hover:scale-105
                "
                :class="[
                  ind === 0 || ind === 4
                    ? 'md:col-start-1'
                    : ind === 1 || ind === 5
                    ? 'md:col-start-3'
                    : ind === 2 || ind === 6
                    ? 'md:col-start-5'
                    : ind === 3 || ind === 7
                    ? 'md:col-start-3'
                    : 'md:col-start-1',
                  'md:col-span-5',
                  $store.state.fullColor
                    ? $store.state.fullColor.name === 'tgreen'
                      ? 'hover:bg-tgreen '
                      : $store.state.fullColor.name === 'tpurple'
                      ? 'hover:bg-tpurple'
                      : $store.state.fullColor.name === 'tblue'
                      ? 'hover:bg-tblue'
                      : $store.state.fullColor.name === 'tbrown'
                      ? 'hover:bg-tbrown'
                      : ''
                    : $colorMode.preference === 'dark'
                    ? 'hover:bg-gray-700'
                    : 'hover:bg-gray-500',
                ]"
              >
                <div
                  class="
                    shadow-lg
                    border border-gray-700
                    dark:border-gray-50
                    p-4
                    flex flex-wrap
                  "
                >
                  <img
                    v-if="section.section_image"
                    loading="lazy"
                    :src="section.section_image.url"
                    :alt="`${section.title} image`"
                    class="image p-4"
                    width="80"
                    height="80"
                  />
                  <div
                    class="px-4"
                    v-html="$md.render(section.section_content)"
                  ></div>
                  <!-- <div
                    class="px-4 line-clamp-3 overflow-hidden"
                    v-html="$md.render(section.section_content)"
                  ></div> -->
                  <!-- <div class="text-right block w-full py-2">
                    <NuxtLink
                      :to="`/services/#${$slugify(
                        section.section_title
                      )}-${ind}`"
                      class="text-right p-2 text-xs uppercase hover:underline"
                    >
                      Read More <span>&rarr;</span>
                    </NuxtLink>
                  </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import * as rules from 'vee-validate/dist/rules'
import DatePicker from '@/components/DatePicker'

import { eventsExtractQuery } from '@/apollo/queries/events/eventsExtracts.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { eventsQuery } from '@/apollo/queries/pages/events.js'
import HeroEventsComponent from '@/components/hero/HeroEventsComponent.vue'

// install rules and localization
Object.keys(rules).forEach((rule) => {
  // eslint-disable-next-line import/namespace
  extend(rule, rules[rule])
})
const qs = require('qs')
export default Vue.extend({
  name: 'EventsPage',
  components: {
    DatePicker,
    HeroEventsComponent,
    ValidationProvider,
    ValidationObserver,
  },
  async asyncData({ $strapi, route }) {
    const data = await $strapi.graphql({ query: eventsQuery() })
    let events = {}
    const queryEl = []
    let searchTerm = null
    if (route.query.q || route.query.d || route.query.e) {
      if (route.query.e) {
        queryEl.push({ event_type_contains: route.query.e })
        searchTerm = '#' + route.query.e
      } else if (route.query.q && route.query.d) {
        queryEl.push({ title_contains: route.query.q })
        queryEl.push({ end_date_gt: route.query.d })
        queryEl.push({ start_date: route.query.d })
      } else if (route.query.q && !route.query.d) {
        queryEl.push({ title_contains: route.query.q })
      } else if (!route.query.q && route.query.d) {
        queryEl.push({ end_date_gt: route.query.d })
        queryEl.push({ start_date: route.query.d })
      }
      const updatedQ = qs.stringify({ _where: { _or: queryEl } })
      // const updatedQ = qs.stringify({ _where: { _and: queryEl } })

      events.singleEvents = await $strapi.find('single-events', updatedQ)
    } else {
      events = await $strapi.graphql({ query: eventsExtractQuery() })
    }
    return {
      page: data.eventsPage,
      events: events.singleEvents,
      searchData: {},
      searchTerm,
      subscriberEmail: null,
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
      if (this.page && this.page.content) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return {}
      }
    },
    sectionUpdated() {
      if (!this.page && !this.page.sections) return
      const x = []
      this.page.sections.forEach((el) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },

    updatedMotto() {
      if (!this.page && !this.page.motto) return
      return formatContentImageUrl(this.page.motto)
    },
    updatedEvents() {
      if (!this.events || (this.events && this.events.length === 0)) return
      const evs = []
      this.events.forEach((el: any) => {
        const e = JSON.stringify(el)
        evs.push(JSON.parse(formatContentImageUrl(e)))
      })
      return evs
    },
  },

  watch: {
    // searchTerm(value) {
    //   if (value) {
    //     this.updateEventsQuery('q', encodeURIComponent(value))
    //   }
    // },
    '$route.query': {
      handler(value) {
        if (value) {
          this.$nextTick(() => {
            this.searchEvents()
          })
        } else {
          this.events = this.$strapi.graphql({ query: eventsExtractQuery() })
        }
      },
      immediate: false,
      deep: true,
    },
  },
  mounted() {
    if (this.$route.query && this.$route.query.q) {
      this.searchTerm = this.$route.query.q
    }
    this.$root.$on('eventDatePicked', (data: any) => {
      this.$nextTick(() => {
        this.updateEventsQuery('d', decodeURIComponent(data))
      })
    })
  },
  methods: {
    updateEventsQuery(keyOrObj: any, value: any) {
      const updatedQuery = { ...this.$route.query }
      if (keyOrObj === 'show_all') {
        Object.keys(updatedQuery).forEach((key) => {
          delete updatedQuery[key]
        })
      } else {
        const obj =
          typeof keyOrObj === 'string' ? { [keyOrObj]: value } : keyOrObj

        Object.keys(obj).forEach((key) => {
          const value = obj[key]

          if (value === null) {
            delete updatedQuery[key]
          } else {
            updatedQuery[key] = value
          }
        })
      }
      this.$router.push({ query: updatedQuery })
    },
    searchEvents() {
      const query = { ...this.$route.query }
      const queryEl = []
      setTimeout(async () => {
        if (query.e) {
          queryEl.push({ event_type_contains: route.query.e })
          this.searchTerm = '#' + route.query.e
        } else if (query.q && query.d) {
          queryEl.push({ title_contains: query.q })
          queryEl.push({ end_date_gt: query.d })
          queryEl.push({ start_date: query.d })
        } else if (query.q && !query.d) {
          queryEl.push({ title_contains: query.q })
        } else if (!query.q && query.d) {
          queryEl.push({ end_date_gt: query.d })
          queryEl.push({ start_date: query.d })
        }
        const updatedQ = qs.stringify({ _where: { _and: queryEl } })
        // const updatedQ = qs.stringify({ _where: { _or: queryEl } })

        const result = await this.$strapi.find('single-events', updatedQ)
        this.events = result
      }, 300)
    },
    clearQuery() {
      this.updateEventsQuery('show_all')
      this.$root.$emit('clearCalendarInput')
      this.searchTerm = null
    },
    async subscribeUser() {
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
        .create('mail-subscriptions', {
          subscriber_email: this.subscriberEmail,
        })
        .then(() => {
          setTimeout(() => {
            this.success = true
            this.errored = false
            setTimeout(() => {
              requestAnimationFrame(() => {
                this.subscriberEmail = null
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
                // this.subscriberEmail = null
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
.spinner {
  margin: 100px auto;
  width: 40px;
  height: 40px;
  position: relative;
  text-align: center;

  -webkit-animation: sk-rotate 2s infinite linear;
  animation: sk-rotate 2s infinite linear;
}

.dot1,
.dot2 {
  width: 60%;
  height: 60%;
  display: inline-block;
  position: absolute;
  top: 0;
  border-radius: 100%;

  -webkit-animation: sk-bounce 2s infinite ease-in-out;
  animation: sk-bounce 2s infinite ease-in-out;
}

.dot2 {
  top: auto;
  bottom: 0;
  -webkit-animation-delay: -1s;
  animation-delay: -1s;
}

@-webkit-keyframes sk-rotate {
  100% {
    -webkit-transform: rotate(360deg);
  }
}
@keyframes sk-rotate {
  100% {
    transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
  }
}

@-webkit-keyframes sk-bounce {
  0%,
  100% {
    -webkit-transform: scale(0);
  }
  50% {
    -webkit-transform: scale(1);
  }
}

@keyframes sk-bounce {
  0%,
  100% {
    transform: scale(0);
    -webkit-transform: scale(0);
  }
  50% {
    transform: scale(1);
    -webkit-transform: scale(1);
  }
}
</style>
