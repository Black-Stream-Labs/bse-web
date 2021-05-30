export default {
  methods: {
    $getStrapiMedia(url) {
      if (url === null) return
      if (url.startsWith('/uploads/')) {
        return `/api/v1${url}`
      }
    },
    $formatContentImageUrl(content) {
      return content.split('/uploads/').join(`/api/v1/uploads/`)
    },
  },
}

export function formatContentImageUrl(content) {
  return content.split('/uploads/').join(`/api/v1/uploads/`)
}

export function getStrapiMedia(url) {
  if (url === null) return
  if (url && url.startsWith('/')) {
    return `/api/v1/${url}`
  }
  return url
}