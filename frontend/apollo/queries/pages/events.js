// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function eventsQuery() {
  const query = gql`
    query EventsPage {
      eventsPage {
        id
        title
        content {
          content
          subtitle
          header_image {
            url
          }
        }
      }
    }
  `
  return query.loc.source.body
}
