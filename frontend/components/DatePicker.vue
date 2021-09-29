<template>
  <div class="w-64" :class="classes">
    <label for="datepicker" class="dark:text-white block">Select Date</label>
    <div class="relative">
      <input
        id="datepicker"
        v-model="datepickerValue"
        name="datepicker"
        type="text"
        readonly
        class="w-full pl-4 pr-10 py-3 text-gray-700 form-input"
        placeholder="Select date"
        @click="
          showDatepicker = true
          initDate()
        "
        @focus="showDatepicker = true"
        @keypress.escape="showDatepicker = false"
        @keypress.enter="showDatepicker = false"
      />

      <div class="absolute top-0 right-0 px-3 py-3">
        <svg
          class="h-6 w-6 text-gray-700"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
          />
        </svg>
      </div>
      <div
        v-if="showDatepicker"
        class="bg-white mt-12 shadow p-4 absolute top-1 left-0 z-10"
        style="width: 17rem"
        @keypress.escape="showDatepicker = false"
        @keypress.enter="showDatepicker = false"
      >
        <div class="flex justify-between items-center mb-2">
          <div>
            <span class="text-lg font-bold text-gray-800">
              {{ MONTH_NAMES[month] }}
            </span>
            <span class="ml-1 text-lg text-gray-600 font-normal">
              {{ year }}
            </span>
          </div>
          <div>
            <button
              class="
                transition
                ease-in-out
                duration-100
                inline-flex
                hover:bg-gray-200
                p-1
                rounded-full
              "
              @click.stop="
                getMonth('minus')
                getNoOfDays()
              "
            >
              <svg
                class="h-6 w-6 text-gray-500 inline-flex"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M15 19l-7-7 7-7"
                />
              </svg>
            </button>
            <button
              type="button"
              class="
                transition
                ease-in-out
                duration-100
                inline-flex
                hover:bg-gray-200
                p-1
                rounded-full
              "
              @click.stop="
                getMonth('plus')
                getNoOfDays()
              "
            >
              <svg
                class="h-6 w-6 text-gray-500 inline-flex"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </button>
          </div>
        </div>

        <div class="flex flex-wrap mb-3 -mx-1">
          <div
            v-for="(day, index) in DAYS"
            :key="`day-${index}`"
            style="width: 14.26%"
            class="px-1"
          >
            <span
              type="button"
              class="text-gray-800 font-medium text-center text-xs"
            >
              {{ day }}
            </span>
          </div>
        </div>

        <div class="flex flex-wrap -mx-1">
          <span
            v-for="(blankday, ind) in blankdays"
            :key="`empty-day-${ind}`"
            style="width: 14.28%"
            class="text-center border p-1 border-transparent text-sm"
          >
            {{ blankday }}
          </span>
          <span
            v-for="(date, dateIndex) in no_of_days"
            :key="`no-days-${dateIndex}`"
            style="width: 14.28%"
            class="px-1 mb-1"
          >
            <a
              key=""
              href="#"
              style="
                width: 14.28%;
                font-feature-settings: 'tnum';
                font-variant-numeric: tabular-nums;
              "
              class="
                px-2
                py-1
                cursor-pointer
                text-center text-sm
                leading-loose
                rounded-full
                transition
                ease-in-out
                duration-100
              "
              :class="{
                'bg-blue-500 text-white': isToday(date),
                'text-gray-700 hover:bg-blue-200': !isToday(date),
              }"
              @click.prevent="getDateValue(date)"
            >
              {{ date }}
            </a>
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'

export default Vue.extend({
  name: 'DatePicker',
  props: {
    classes: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      showDatepicker: false,
      datepickerValue: '',
      MONTH_NAMES: [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ],
      DAYS: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      month: '',
      year: '',
      no_of_days: [],
      blankdays: [],
      days: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    }
  },
  computed: {},
  watch: {
    // '$route.query'() {
    //   if (this.$route.query && this.$route.query.d) {
    //     this.datepickerValue = this.$route.query.d
    //   } else {
    //     this.datepickerValue = ''
    //   }
    // },
  },
  mounted() {
    if (this.$route.query && this.$route.query.d) {
      this.datepickerValue = this.$route.query.d
    } else {
      this.datepickerValue = ''
    }
    // this.initDate()
    this.getNoOfDays()
    this.$root.$on('eventDatePicked', () => {
      this.showDatepicker = false
    })
    this.$root.$on('clearCalendarInput', () => {
      this.showDatePicker = false
      this.datepickerValue = ''
    })
  },
  methods: {
    initDate() {
      const today = new Date()
      this.month = today.getMonth()
      this.year = today.getFullYear()
      this.datepickerValue = new Date(
        this.year,
        this.month,
        today.getDate()
      ).toDateString()
    },
    getMonth(month) {
      if (month === 'plus') {
        if (this.month === 11) {
          this.month = 0
          this.year++
        } else {
          this.month++
        }
      }
      if (month === 'minus') {
        if (this.month === 0) {
          this.month = 11
          this.year--
        } else {
          this.month--
        }
      }
    },
    isToday(date) {
      const today = new Date()
      const d = new Date(this.year, this.month, date)

      return today.toDateString() === d.toDateString()
    },
    getDateValue(date) {
      const selectedDate = new Date(this.year, this.month, date)
      this.datepickerValue = selectedDate.toDateString()

      // this.$refs.date.value =
      //   selectedDate.getFullYear() +
      //   '-' +
      //   ('0' + selectedDate.getMonth()).slice(-2) +
      //   '-' +
      //   ('0' + selectedDate.getDate()).slice(-2)
      this.$root.$emit(
        'eventDatePicked',
        encodeURIComponent(selectedDate.toISOString())
      )
      this.showDatePicker = false
    },

    getNoOfDays() {
      const daysInMonth = new Date(this.year, this.month + 1, 0).getDate()

      // find where to start calendar day of week
      const dayOfWeek = new Date(this.year, this.month).getDay()
      const blankdaysArray = []
      for (let i = 1; i <= dayOfWeek; i++) {
        blankdaysArray.push(i)
      }

      const daysArray = []
      for (let i = 1; i <= daysInMonth; i++) {
        daysArray.push(i)
      }

      this.blankdays = blankdaysArray
      this.no_of_days = daysArray
    },
  },
})
</script>

<style scoped></style>
