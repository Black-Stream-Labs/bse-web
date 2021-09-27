// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productMainCategoriesQuery() {
  const query = gql`
    query ProductMainCategories {
      productMainCategories {
        id
        categ_name
        slug
        image {
          url
        }
        description
        products {
          id
          slug
          product_name
        }
      }
    }
  `
  return query.loc.source.body
}
