<template>
  <VDropdown placement="right">
    <!-- Button content -->
    <template #button>
      <span
        class="mr-2 hidden lg:inline-block"
        @click="$root.$emit('closeNavigation')"
        >Accesibility</span
      >
      <span
        class="hidden lg:inline-block"
        @click="$root.$emit('closeNavigation')"
      >
        <DownArrow></DownArrow>
      </span>
      <span
        class="px-2 py-2 rounded items-center text-sm lg:hidden"
        @click="$root.$emit('closeNavigation')"
      >
        <SettingsImage width="24" height="24"></SettingsImage>
      </span>
    </template>
    <!-- Opened dropdown content -->
    <template #content>
      <VColorSelect></VColorSelect>
      <AccesibilityFontSize></AccesibilityFontSize>
      <AccesibilityFonts></AccesibilityFonts>
    </template>
  </VDropdown>
</template>

<script lang="ts">
// @ts-nocheck
import Vue from 'vue'
import VDropdown from '@/components/reusable/VDropdown'
import SettingsImage from '@/components/icons/SettingsImage'
import VColorSelect from '@/components/reusable/VColorSelect'
import DownArrow from '@/components/icons/DownArrow'
import AccesibilityFontSize from '@/components/accessibility/AccesibilityFontSize'
import AccesibilityFonts from '@/components/accessibility/AccesibilityFonts'
export default Vue.extend({
  name: 'AccesibilityMenu',
  components: {
    VDropdown,
    SettingsImage,
    DownArrow,
    AccesibilityFontSize,
    // AccesibilityContrast,
    AccesibilityFonts,
    VColorSelect,
  },
  props: {
    color: {
      type: String,
      default: 'white',
    },
  },
  data() {
    return {}
  },
  mounted() {},
  methods: {},
})
</script>

<style scoped></style>
