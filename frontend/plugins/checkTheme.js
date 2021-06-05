if (
  localStorage['nuxt-color-mode'] === 'dark' ||
  (!('nuxt-color-mode' in localStorage) &&
    window.matchMedia('(prefers-color-scheme: dark)').matches)
) {
  document.documentElement.classList.add('dark')
} else {
  document.documentElement.classList.remove('dark')
}
