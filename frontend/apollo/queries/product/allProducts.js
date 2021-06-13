// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function allProdQuery() {
  const query = gql`
    query {
      products {
        id
        title
        description
        price
        image {
          url
          formats
        }
        slug
        productcategories {
          name
          slug
          id
        }
      }
    }
  `
  return query.loc.source.body
}
