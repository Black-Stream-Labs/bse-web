// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function singleArticle() {
  const query = gql`
    query Articles($slug: String!) {
      articles(where: { slug: $slug }) {
        slug
        id
        content {
          subtitle
          content
          header_image {
            url
          }
        }
        published_at
        unpublish_date
      }
    }
  `
  return query.loc.source.body
}
