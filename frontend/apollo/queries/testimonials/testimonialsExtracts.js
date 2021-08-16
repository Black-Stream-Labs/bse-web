// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function testimonialsExtracts() {
  const query = gql`
    query Testimonials {
      testimonials {
        published_at
        updated_at
        author_name
        text
        author_image {
          name
          formats
          alternativeText
          url
        }
      }
    }
  `
  return query.loc.source.body
}
