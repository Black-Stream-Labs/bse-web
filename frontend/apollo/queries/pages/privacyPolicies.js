// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function privacyPoliciesQuery() {
  const query = gql`
    query privacyPolicies {
      privacyPolicy {
        id
        title
        content {
          content
          subtitle
          header_image {
            url
          }
        }
        extraContent
        motto
      }
    }
  `
  return query.loc.source.body
}
