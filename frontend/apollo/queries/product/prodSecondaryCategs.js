// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productSecondaryCategoriesQuery() {
  const query = gql`
    query ProductSecondaryCategories {
      productSecondaryCategories {
        id
        categ_name
        slug
        products {
          id
          slug
          product_name
          product_main_image {
            previewUrl
          }
          price
          product_description
          product_secondary_categories {
            id
            slug
            categ_name
          }
          product_main_categories {
            id
            slug
            categ_name
          }
        }
      }
    }
  `
  return query.loc.source.body
}
