// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function singleAuthor() {
  const query = gql`
    query Users($slug: String!) {
      users(where: { username: $slug }) {
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
