// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function aboutQuery() {
  const query = gql`
    query About {
      about {
        id
        title
        content {
          content
          subtitle
          header_image {
            url
          }
        }
        motto
        sections {
          section_title
          section_image {
            url
          }
          section_content
        }
        extraContent
      }
    }
  `
  return query.loc.source.body
}
