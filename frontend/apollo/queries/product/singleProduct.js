// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function singleProdQuery() {
  const query = gql`
    query Product($slug: String!) {
      products(where: { slug: $slug }) {
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
