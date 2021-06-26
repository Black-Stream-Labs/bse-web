// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productCategoriesQuery() {
  const query = gql`
    query ProductCategories {
      productCategories {
        id
        categ_name
        slug
        products {
          id
          slug
          is_digital_product
          product_name
          published_at
          product_description
          product_main_image {
            id
            url
            name
          }
          product_images {
            id
            name
            url
          }
          product_categories {
            slug
            categ_name
          }
        }
      }
    }
  `
  return query.loc.source.body
}
