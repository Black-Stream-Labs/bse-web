// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function eventsQuery() {
  const query = gql`
    query EventsPage {
      eventsPage {
        id
        title
        motto
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
