// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function faqQuery() {
  const query = gql`
    query faqPage {
      faqPage {
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
