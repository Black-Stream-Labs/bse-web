<template>
  <div :class="heightClass">
    <VueCal
      :disable-views="['years', 'year']"
      click-to-navigate
      active-view="month"
      events-count-on-year-view
      today-button
      :selected-date="selectedDate"
      :events="events"
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
  </div>
</template>

<script>
import { mdiCalendar } from '@mdi/js'
import Vue from 'vue'
import VueCal from 'vue-cal'
import 'vue-cal/dist/vuecal.css'
export default Vue.extend({
  name: 'Calendar',
  components: { VueCal },
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
      selectedDate: new Date(),
      events: [
        {
          start: '2021-06-21',
          end: '2021-06-21',
          title: 'Need to go shopping',
          content: '<i class="v-icon material-icons">shopping_cart</i>',
          class: 'leisure',
        },
        {
          start: '2021-06-21',
          end: '2021-07-21',
          title: 'Golf with John',
          content: '<i class="v-icon material-icons">golf_course</i>',
          class: 'sport',
        },
        {
          start: '2021-06-22',
          end: '2021-06-22',
          title: "Dad's birthday!",
          content: '<i class="v-icon material-icons">cake</i>',
          class: 'sport',
        },
      ],
    }
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
