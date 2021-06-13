// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function servicesQuery() {
  const query = gql`
    query Services {
      service {
        id
        title
        content {
          subtitle
          id
          content
          subtitle
          header_image {
            url
          }
        }
        sections {
          section_title
          section_content
          section_image {
            url
          }
        }
      }
    }
  `
  return query.loc.source.body
}
