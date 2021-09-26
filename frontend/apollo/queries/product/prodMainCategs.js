// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productMainCategoriesQuery() {
  const query = gql`
    query ProductMainCategories {
      productMainCategories {
        id
        categ_name
        slug
        products {
          product_secondary_categories {
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
