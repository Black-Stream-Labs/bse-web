// eslint-disable-next-line import/no-named-as-default
import gql from 'graphql-tag'

export function allProdQuery() {
  const query = gql`
    query Products {
      products(limit: 1, start: 0) {
        id
        product_name
        product_description
        price
        is_digital_product
        published_at
        product_images {
          url
          name
        }
        slug
        product_main_image {
          name
          url
        }
        product_categories {
          id
          categ_name
          slug
        }
      }
    }
  `
  return query.loc.source.body
}
