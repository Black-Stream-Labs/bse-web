// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function eventsExtractQuery() {
  const query = gql`
    query SingleEvents {
      singleEvents {
        id
        start_date
        end_date
        title
        slug
        description
        event_type
        header_image {
          url
        }
      }
    }
  `
  return query.loc.source.body
}
