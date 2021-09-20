// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function articleExtracts() {
  const query = gql`
    query Articles {
      articles {
        slug
        title
        published_at
        unpublish_date
        future_publish_date
        content {
          content
          subtitle
          header_image {
            previewUrl
            url
            formats
          }
        }
        description
        article_tags {
          id
          tag_name
          slug
        }
        article_categories {
          id
          category
          slug
        }
      }
    }
  `
  return query.loc.source.body
}
