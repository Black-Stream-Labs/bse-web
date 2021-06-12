import gql from 'graphql-tag'

export function articleExtracts() {
  const query = gql`
    query Articles {
      articles {
        slug
        title
        article_content {
          content
          subtitle
          header_image {
            previewUrl
            url
            formats
          }
        }
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
