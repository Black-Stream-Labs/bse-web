export default {
  methods: {
    $getStrapiMedia(url) {
      if (url === null) return
      if (url.startsWith('/uploads/')) {
        return `/api/v1${url}`
      }
    },
    $formatContentImageUrl(content) {
      if (!content) return
      return content.includes('/uploads/')
        ? content.split('/uploads/').join(`/api/v1/uploads/`)
        : content
    },
  },
}
export function formatContentImageUrl(content) {
  if (!content) return
  return content.includes('/uploads/')
    ? content.split('/uploads/').join(`/api/v1/uploads/`)
    : content
}
export function getStrapiMedia(url) {
  if (url === null) return
  if (url.startsWith('/uploads/')) {
    return `/api/v1${url}`
  }
}
