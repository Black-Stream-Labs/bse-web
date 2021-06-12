// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function singleAuthor() {
  const query = gql`
    query Users($username: String!) {
      users(where: { username: $username }) {
        username
        id
        articles {
          slug
          title
          article_categories {
            slug
            category
          }
          article_tags {
            slug
            tag_name
          }
        }
      }
    }
  `
  return query.loc.source.body
}
