// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function teamQuery() {
  const query = gql`
    query TeamMember {
      teamMembers {
        id
        member_name
        member_image {
          url
        }

        member_description
      }
    }
  `
  return query.loc.source.body
}
