<template>
  <div class="relative flex justify-center items-center">
    <button
      class="
        z-20
        relative
        px-2
        py-2
        lg:border
        border-gray-400
        rounded
        items-center
        text-sm
        flex
      "
      @click="open = !open"
    >
      <slot name="button"></slot>
    </button>
    <!-- to close when clicked on space around it in desktop-->
    <button
      v-if="open"
      class="fixed inset-0 h-full w-full cursor-default"
      tabindex="-1"
      @click="open = false"
    ></button>
    <!--dropdown content: desktop-->
    <transition
      enter-active-class="transition-all duration-200 ease-out"
      leave-active-class="transition-all duration-750 ease-in"
      enter-class="opacity-0 scale-75"
      enter-to-class="opacity-100 scale-100"
      leave-class="opacity-100 scale-100"
      leave-to-class="opacity-0 scale-75"
    >
      <div
        v-if="open"
        class="
          absolute
          shadow-lg
          border
          w-72
          rounded
          py-1
          px-2
          text-sm
          mt-4
          bg-gray-50
          top-10
          dark:bg-gray-900 dark:text-white
        "
        :style="fullColor ? 'background:var(--background-end)' : ''"
        :class="
          placement === 'right' ? 'right-0' : 'center' ? 'mx-auto' : 'left-0'
        "
      >
        <slot name="content"></slot>
      </div>
    </transition>

    <!--dropdown content: mobile-->
    <!-- <transition
      enter-active-class="transition-all duration-200 ease-out"
      leave-active-class="transition-all duration-750 ease-in"
      enter-class="opacity-0 scale-75"
      enter-to-class="opacity-100 scale-100"
      leave-class="opacity-100 scale-100"
      leave-to-class="opacity-0 scale-75"
    >
      <div
        v-if="open"
        class="md:hidden fixed inset-x-0 bottom-0 bg-gray-50 w-full z-20 px-2 py-2 shadow-2xl leading-loose dark:bg-gray-900 dark:text-white"
      >
        <slot name="content"></slot>
      </div>
    </transition> -->
    <!-- to close when clicked on space around it in mobile-->
    <!-- <div
      v-if="open"
      class="md:hidden fixed w-full h-full inset-0 bg-gray-900 opacity-50 z-10"
      @click="open = false"
    ></div> -->
  </div>
</template>

<script>
export default {
  name: 'VDropdown',

  props: {
    placement: {
      type: String,
      default: 'right',
      validator: (value) => ['right', 'center', 'left'].includes(value),
    },
  },
  data() {
    return {
      open: false,
    }
  },
  computed: {
    fullColor() {
      return this.$store.state.fullColor
    },
  },
  mounted() {
    const onEscape = (e) => {
      if (e.key === 'Esc' || e.key === 'Escape') {
        this.open = false
      }
    }

    document.addEventListener('keydown', onEscape)

    this.$once('hook:beforeDestroy', () => {
      document.removeEventListener('keydown', onEscape)
    })
  },
}
</script>
