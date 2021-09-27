// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productSecondaryCategoriesQuery() {
  const query = gql`
    query ProductSecondaryCategories {
      productSecondaryCategories {
        id
        categ_name
        slug
        image {
          url
        }
        description
      }
    }
  `
  return query.loc.source.body
}
