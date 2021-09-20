// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function domainExpertsQuery() {
  const query = gql`
    query domainExperts {
      domainExperts {
        id
        url
        title
        image {
          url
        }
      }
    }
  `
  return query.loc.source.body
}
