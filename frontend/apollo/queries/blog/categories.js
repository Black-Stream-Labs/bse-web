import gql from 'graphql-tag'

export function articleCategories() {
  const query = gql`
    query ArticleCategories {
      articleCategories {
        slug
        category
        id
        articles {
          slug
          title
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
