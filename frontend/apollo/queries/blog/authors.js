import gql from 'graphql-tag'

export function authors() {
  const query = gql`
    query Users {
      users {
        username
        id
        articles {
          slug
          title
          description
          content {
            header_image {
              url
            }
          }
          published_at
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
