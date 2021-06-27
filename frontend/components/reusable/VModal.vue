<template>
  <Transition name="fade">
    <div
      v-show="opened"
      tabindex="0"
      role="dialog"
      :aria-hidden="!opened"
      class="
        fixed
        w-full
        h-full
        top-0
        left-0
        flex
        items-center
        justify-center
        z-50
      "
    >
      <div
        class="absolute w-full h-full bg-gray-900 opacity-75 z-50"
        @click.self="close"
      ></div>

      <div class="absolute max-h-full z-50" :class="maxWidth">
        <div
          class="
            container
            bg-white
            overflow-hidden
            md:rounded
            modal
            dark:bg-gray-800
            text-gray-800
            dark:text-gray-100
          "
        >
          <div
            class="
              px-4
              py-4
              leading-none
              flex
              justify-between
              items-center
              font-medium
              bg-gray-100
              dark:bg-gray-700
              border-b
            "
          >
            <h3>{{ title || 'Product Image' }}</h3>
            <button
              aria-label="close"
              class="
                flex
                justify-center
                align-center
                text-gray-500
                dark:text-gray-100
                focus-within:bg-gray-500 focus-within:text-gray-100
                rounded
                hover:text-gray-700 hover:bg-gray-200
                dark:focus-within:bg-gray-500
                dark:focus-within:text-gray-200
                dark:hover:text-gray-100
                dark:hover:bg-gray-500
              "
              @click.prevent="close"
            >
              <span class="text-2xl px-4 py-2"> &#215; </span>
            </button>
          </div>

          <div class="max-h-full px-4 py-4">
            <slot></slot>
          </div>
        </div>
      </div>
    </div>
  </Transition>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    image: {
      type: Object,
      default: () => {},
    },
    opened: {
      type: Boolean,
      default: false,
    },
    title: {
      type: [String, null],
      default: null,
    },
    header: {
      type: [String, null],
      required: false,
      default: null,
    },
    width: {
      type: String,
      default: 'full',
      validator: (value) => ['xs', 'sm', 'md', 'lg', 'full'].includes(value),
    },
  },
  data() {
    return {}
  },
  computed: {
    maxWidth() {
      switch (this.width) {
        case 'xs':
          return 'max-w-lg'
        case 'sm':
          return 'max-w-xl'
        case 'md':
          return 'max-w-2xl'
        case 'lg':
          return 'max-w-3xl'
        case 'full':
          return 'max-w-full'
        default:
          return 'max-w-full'
      }
    },
  },
  watch: {
    async opened(value) {
      if (value) {
        await this.$nextTick()
        document.querySelector('body').classList.add('overflow-hidden')
        this.$el.focus()
      }
      document.querySelector('body').classList.remove('overflow-hidden')
    },
  },

  mounted() {
    const onEscape = (e: any) => {
      if (e.key === 'Esc' || e.key === 'Escape') {
        this.close()
      }
    }

    document.addEventListener('keydown', onEscape)

    this.$once('hook:beforeDestroy', () => {
      document.removeEventListener('keydown', onEscape)
    })
  },
  methods: {
    close() {
      this.$emit('close')
    },
  },
})
</script>
<style lang="postcss" scoped>
.modal {
  max-width: 60rem;
}
.fade-enter-active,
.fade-leave-active {
  transition: all 0.4s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
