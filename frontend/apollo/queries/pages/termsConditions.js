// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function termsConditionsQuery() {
  const query = gql`
    query termsConditions {
      termsCondition {
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
