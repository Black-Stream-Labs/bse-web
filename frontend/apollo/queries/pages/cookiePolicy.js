// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function cookiePolicyQuery() {
  const query = gql`
    query CookiePolicy {
      cookiePolicy {
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
