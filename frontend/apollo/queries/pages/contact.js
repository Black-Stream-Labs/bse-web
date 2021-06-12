// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function contact() {
  const query = gql`
    query Contact {
      contact {
        id
        title
        content {
          content
          subtitle
          header_image {
            url
          }
        }
        sections {
          section_title
          section_image {
            url
          }
          section_content
        }
      }
    }
  `
  return query.loc.source.body
}
