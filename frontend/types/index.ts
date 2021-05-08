/* eslint-disable camelcase */
export interface ProductCustomFields {
  id: number
  title: string
  required: boolean
  options: string
}
export interface ImageFormats {
  thumbnail: {
    name: string
    hash: string
    ext: string
    mime: string
    width: number
    height: number
    size: number
    path: [string | null]
    url: [string | null]
  }
  small: {
    name: string
    hash: string
    ext: string
    mime: string
    width: number
    height: number
    size: number
    path: [string | null]
    url: [string | null]
  }
}
export interface ImageType {
  id: number
  name: string
  alternativeText: [string | null]
  caption: [string | null]
  width: number
  height: number
  formats: ImageFormats | null
  hash: string
  ext: string
  mime: string
  size: number
  url: string
  previewUrl: [string | null]
  provider: string
  provider_metadata: [string | null]
  created_at: string
  updated_at: string
}

export interface ProductCategory {
  id: number
  name: string
  slug: string
  created_at: string
  updated_at: string
  headerimage: ImageType | null
}

export interface ProductComment {
  id: number
  content: string
  blocked: false
  blockedThread: false
  blockReason: string | null
  points: number
  authorUser: number
  authorType: string
  authorId: string
  authorName: string
  authorEmail: string
  authorAvatar: string
  threadOf: number
  created_at: string
  updated_at: string
  related: any[]
}
export interface Product {
  id: number
  title: string
  description: string
  price: number
  status: string
  slug: string
  created_at: string
  updated_at: string
  Custom_field: ProductCustomFields[]
  image: ImageType | null
  productcategories: ProductCategory[]
  comments: ProductComment
}

export interface Categories {
  id: number
  name: string
  slug: string
  products: Product[]
}
export interface PageType {
  id: number | null
  title: string | null
  slug: string | null
  headerimage: ImageType | null
  content: string | null
}

export interface HomePage {
  slug: string
  content: string
  headerImage: ImageType
}
