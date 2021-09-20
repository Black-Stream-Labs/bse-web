// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function socialMediaQuery() {
  const query = gql`
    query socialMediaAccount {
      socialMediaAccounts {
        id
        URL
        title
        image {
          url
        }
      }
    }
  `
  return query.loc.source.body
}
