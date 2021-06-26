// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function productFiltersQuery() {
  const query = gql`
    query ProductFilters {
      productFilters {
        id
        filter_name
        slug
      }
    }
  `
  return query.loc.source.body
}
