<template>
  <VDropdown placement="right">
    <!-- Button content -->
    <template #button>
      <span
        class="px-2 py-2 border border-gray-400 rounded items-center text-sm hidden lg:inline-flex"
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
      <AccesibilityFontSize></AccesibilityFontSize>
      <AccesibilityContrast></AccesibilityContrast>
      <AccesibilityFonts></AccesibilityFonts>
    </template>
  </VDropdown>
</template>

<script lang="ts">
// @ts-nocheck
import Vue, { PropOptions } from 'vue'
import VDropdown from '@/components/reusable/VDropdown'
import SettingsImage from '@/components/icons/SettingsImage'
import VColorSelect from '@/components/reusable/VColorSelect'
import DownArrow from '@/components/icons/DownArrow'
import AccesibilityFontSize from '@/components/AccesibilityFontSize'
import AccesibilityContrast from '@/components/AccesibilityContrast'
import AccesibilityFonts from '@/components/AccesibilityFonts'
export default Vue.extend({
  name: 'AccesibilityMenu',
  components: {
    VDropdown,
    SettingsImage,
    DownArrow,
    AccesibilityFontSize,
    AccesibilityContrast,
    AccesibilityFonts,
    VColorSelect,
  },
  props: {
    dinamicColor: {
      type: String,
      default: 'indigo',
    } as PropOptions,
  },
  data() {
    return {}
  },
  mounted() {},
  methods: {},
})
</script>

<style scoped></style>
