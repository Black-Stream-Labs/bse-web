// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function singleprogCategQuery() {
  const query = gql`
    query ProductCategory($slug: String!) {
      categories(where: { slug: $slug }) {
        id
        name
        slug
        products {
          id
          slug
          price
          description
          title
          image {
            url
          }
        }
      }
    }
  `
  return query.loc.source.body
}
