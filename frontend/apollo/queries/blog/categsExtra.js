// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function categsExtra() {
  const query = gql`
    query ArticleCategories {
      articleCategories {
        slug
        category
        id
        articles {
          slug
          title
          description
          published_at
          unpublish_date
          future_publish_date
          article_categories {
            slug
            id
            category
          }
          content {
            content
            header_image {
              url
            }
          }
          author {
            username
            id
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
