// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productCategoriesQuery() {
  const query = gql`
    query ProductCategories {
      categories {
        id
        name
        slug
      }
    }
  `
  return query.loc.source.body
}
