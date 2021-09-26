// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function singleprogMainCategQuery() {
  const query = gql`
    query ProductMainCategory($slug: String!) {
      productMainCategories(where: { slug: $slug }) {
        id
        slug
        categ_name
        products {
          id
          product_name
          slug
          product_main_image {
            previewUrl
          }
          product_description
          price
          is_digital_product
        }
      }
    }
  `
  return query.loc.source.body
}
