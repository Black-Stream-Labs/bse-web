<template>
  <div class="pb-10">
    <div :class="heightClass">
      <VueCal
        :disable-views="['years', 'year']"
        click-to-navigate
        active-view="month"
        events-count-on-year-view
        today-button
        :selected-date="selectedDate"
        :events="updatedEvents"
        :on-event-click="onEventClick"
        events-on-month-view="short"
        :min-cell-width="320"
        :drag-to-create-event="false"
        show-week-numbers
        small
        resize-x
      >
        <template #today-button>
          <button>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24 "
              width="24"
              height="24"
              stroke="currentColor"
            >
              <path :d="calendar_icon"></path>
            </svg>
          </button>
        </template>
        <!-- <template #title="{ title, view }">
        🎉
        <span v-if="view.id === 'years'">Years</span>
        <span v-else-if="view.id === 'year'">{{
          view.startDate.format('YYYY')
        }}</span>
        <span v-else-if="view.id === 'month'">{{
          view.startDate.format('MMMM YYYY')
        }}</span>
        <span v-else-if="view.id === 'week'"
          >w{{ view.startDate.getWeek() }} ({{
            view.startDate.format('MMM YYYY')
          }})</span
        >
        <span v-else-if="view.id === 'day'">{{
          view.startDate.format('dddd D MMMM (YYYY)')
        }}</span>
        🎉
      </template> -->
        <!-- <template #cell-content="{ cell, view, events, goNarrower }">
          <span
            v-if="view.id === 'day'"
            class="vuecal__cell-date"
            :class="view.id"
            @click="goNarrower"
          >
            {{ cell.date.getDate() }}
          </span>
          <span
            v-if="view.id === 'month' && events.length"
            class="vuecal__cell-events-count"
            >{{ events.length }}</span
          >
          <span
            v-if="['week', 'day'].includes(view.id) && !events.length"
            class="vuecal__no-event"
            >Nothing here 👌</span
          >
        </template> -->
      </VueCal>
      <!-- add dialog ans show summary with click to event page and click to close to make event null -->
    </div>

    <VModal
      v-if="selectedEvent"
      :header="selectedEvent.title"
      :title="selectedEvent.title"
      :opened="selectedEvent ? true : false"
      @close="selectedEvent = null"
    >
      <div>
        <p>
          Start Date:
          <span class="bold">
            {{
              new Date(selectedEvent.start).toLocaleString('en-GB', {
                month: 'short',
                weekday: 'long',
                day: 'numeric',
                year: 'numeric',
              })
            }}
          </span>
        </p>
        <p class="pb-5">
          End Date:
          <span class="bold">
            {{
              new Date(selectedEvent.end).toLocaleString('en-GB', {
                month: 'short',
                weekday: 'long',
                day: 'numeric',
                year: 'numeric',
              })
            }}
          </span>
        </p>
        <div class="line-clamp-5" v-html="selectedEvent.content"></div>
        <div class="flex align-items-end justify-end pt-3">
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
            :to="`/events/${selectedEvent.slug}`"
          >
            More details
          </NuxtLink>
        </div>
      </div>
    </VModal>
  </div>
</template>

<script>
import { mdiCalendar } from '@mdi/js'
import Vue from 'vue'
import VueCal from 'vue-cal'
import 'vue-cal/dist/vuecal.css'
import { eventsExtractQuery } from '../../apollo/queries/events/eventsExtracts'
import VModal from '@/components/reusable/VModal'
export default Vue.extend({
  name: 'Calendar',
  components: { VueCal, VModal },
  props: {
    heightClass: {
      type: String,
      default: 'h-128',
    },
  },
  data() {
    return {
      calendar_icon: mdiCalendar,
      showDialog: false,
      selectedEvent: null,
      selectedDate: new Date(),
      events: [],
      // events: [
      //   {
      //     id: '1',
      //     start: '2021-06-21',
      //     end: '2021-06-21',
      //     title: 'Need to go shopping',
      //     content: '<i class="v-icon material-icons">shopping_cart</i>',
      //     class: 'leisure',
      //   },
      // ],
    }
  },
  async fetch() {
    const events = await this.$strapi.graphql({ query: eventsExtractQuery() })
    this.events = events.singleEvents
  },
  computed: {
    updatedEvents() {
      const evs = this.events || []
      const updatedEvs = evs.map((el) => {
        return {
          start: new Date(el.start_date),
          id: el.id,
          end: new Date(el.end_date),
          title: el.title,
          slug: el.slug,
          content: this.$md.render(el.description),
        }
      })
      return updatedEvs
    },
  },
  methods: {
    onEventClick(event, e) {
      this.selectedEvent = event
      this.showDialog = true

      // Prevent navigating to narrower view (default vue-cal behavior).
      e.stopPropagation()
    },
  },
})
</script>
<style lang="postcss" scoped>
.vuecal__now-line {
  color: #06c;
}
.vuecal__event.leisure {
  background-color: rgba(253, 156, 66, 0.9);
  border: 1px solid rgb(233, 136, 46);
  color: #fff;
}
.vuecal__event.sport {
  background-color: rgba(255, 102, 102, 0.9);
  border: 1px solid rgb(235, 82, 82);
  color: #fff;
}
.vuecal__cell-events-count {
  width: 18px;
  height: 2px;
  color: transparent;
}
</style>
