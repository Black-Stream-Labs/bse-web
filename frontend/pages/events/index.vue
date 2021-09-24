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
        <div class="flex flex-wrap">
          <label class="block mr-3 dark:text-white">
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
          <DatePicker />
          <div v-if="updatedEvents" class="grid grid-cols-6 gap-4 py-5">
            <!-- events -->
            <div
              v-for="(event, id) in updatedEvents"
              :key="`event-${id}`"
              class="
                shadow-md
                rounded-md
                overflow-hidden
                col-span-6
                md:col-span-3
                lg:col-span-2
                flex flex-col
              "
            >
              <div class="flex-2">
                <img
                  v-if="event.header_image"
                  :src="event.header_image.url"
                  class=""
                  :alt="`${event.title} image`"
                  height="150"
                />
                <img v-else src="" class="" alt="" />
              </div>
              <div class="p-4">
                <h5 class="text-xl font-semibold mb-2">{{ event.title }}</h5>
                <div
                  class="mb-4 line-clamp-4"
                  v-html="$md.render(event.description)"
                ></div>
                <div class="text-right">
                  <NuxtLink
                    class="
                      px-2
                      py-1
                      text-xs
                      border
                      rounded
                      border-gray-400
                      dark:bg-gray-900 dark:text-white dark:border-gray-50
                    "
                    :class="$store.state.fullColor ? 'text-white' : ''"
                    :style="
                      $store.state.fullColor
                        ? `background:  var(--background-end)`
                        : ''
                    "
                    :to="`/events/${event.slug}`"
                  >
                    More details
                  </NuxtLink>
                </div>
              </div>
            </div>
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
        class="container max-w-5xl mx-auto px-4 py-10"
        :class="$store.state.fullColor ? 'text-white' : ''"
      >
        <div v-html="$md.render(updatedContent)" />
      </div>
    </section>

    <section v-if="sectionUpdated" id="whatwedo" class="section">
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

import Hero from '@/components/hero/Hero'
import DatePicker from '@/components/DatePicker'

import { eventsExtractQuery } from '@/apollo/queries/events/eventsExtracts.js'
import { formatContentImageUrl } from '@/mixins/updateImageUrl.js'
import { eventsQuery } from '@/apollo/queries/pages/events.js'

const qs = require('qs')
export default Vue.extend({
  name: 'EventsPage',
  components: {
    Hero,
    DatePicker,
  },
  async asyncData({ $strapi, route }) {
    const data = await $strapi.graphql({ query: eventsQuery() })
    let events = {}
    const queryEl = []
    if (route.query.q || route.query.d) {
      if (route.query.q && route.query.d) {
        queryEl.push({ title_contains: route.query.q })
        queryEl.push({ start_date_contains: ruote.query.d })
      } else if (route.query.q && !route.query.d) {
        queryEl.push({ title_contains: route.query.q })
      } else if (!route.query.q && route.query.d) {
        queryEl.push({ start_date_lt: route.query.d })
        queryEl.push({ end_date_gt: route.query.d })
        queryEl.push({ start_date: route.query.d })
      }
      const updatedQ = qs.stringify({ _where: { _or: queryEl } })

      events.singleEvents = await $strapi.find('single-events', updatedQ)
    } else {
      events = await $strapi.graphql({ query: eventsExtractQuery() })
    }
    // console.log('events', events)
    return {
      page: data.eventsPage,
      events: events.singleEvents,
      searchData: {},
      searchTerm: null,
    }
  },
  computed: {
    updatedContent() {
      if (this.page.content) {
        return formatContentImageUrl(this.page.content.content)
      } else {
        return {}
      }
    },
    sectionUpdated() {
      if (!this.page.sections) return
      const x = []
      this.page.sections.forEach((el) => {
        const e = JSON.stringify(el)
        x.push(JSON.parse(formatContentImageUrl(e)))
      })
      return x
    },
    updatedHeaderIMage() {
      if (this.page.content && this.page.content.header_image) {
        return this.page.content.header_image.url
      } else {
        return null
      }
    },
    updatedMotto() {
      if (!this.page.motto) return
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
    searchTerm(value) {
      console.log('searchTerm value', value)
      if (value) {
        this.updateEventsQuery('q', encodeURIComponent(value))
      }
    },
    '$route.query': {
      handler(value) {
        console.log('query value', value)
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
        if (query.q && query.d) {
          queryEl.push({ title_contains: query.q })
          queryEl.push({ start_date_contains: ruote.query.d })
        } else if (query.q && !query.d) {
          queryEl.push({ title_contains: query.q })
        } else if (!query.q && query.d) {
          // queryEl.push({ start_date_lt: query.d })
          queryEl.push({ end_date_gt: query.d })
          queryEl.push({ start_date: query.d })
        }
        const updatedQ = qs.stringify({ _where: { _or: queryEl } })

        const result = await this.$strapi.find('single-events', updatedQ)
        console.log('updated query resutls', result)
        this.events = result
      }, 300)
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
