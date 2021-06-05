<template>
  <VDropdown placement="right">
    <!-- Button content -->
    <template #button>
      <span
        class="px-2 py-2 border rounded items-center text-sm hidden lg:inline-flex"
      >
        <span class="mr-2">Accesibility</span>
        <DownArrow></DownArrow>
      </span>
      <span class="px-2 py-2 md:border rounded items-center text-sm lg:hidden">
        <SettingsImage
          width="24"
          height="24"
          :color="dinamicColor"
        ></SettingsImage>
      </span>
    </template>

    <!-- Opened dropdown content -->
    <template #content>
      <VColorSelect></VColorSelect>
      <FontSize></FontSize>
      <AccesibilityColours></AccesibilityColours>
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
import FontSize from '@/components/FontSize'
import AccesibilityColours from '@/components/AccesibilityColours'
import AccesibilityFonts from '@/components/AccesibilityFonts'
export default Vue.extend({
  name: 'AccesibilityMenu',
  components: {
    VDropdown,
    SettingsImage,
    DownArrow,
    FontSize,
    AccesibilityColours,
    AccesibilityFonts,
    VColorSelect,
  },
  data() {
    return {
      dinamicColor: 'white',
    }
  },
  mounted() {
    this.checkColor()
  },
  methods: {
    checkColor() {
      localStorage.theme === 'light'
        ? (this.dinamicColor = 'indigo')
        : (this.dinamicColor = 'white')
    },
  },
})
</script>

<style scoped></style>
