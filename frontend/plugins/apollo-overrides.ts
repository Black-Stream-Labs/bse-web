import { Plugin } from '@nuxt/types'

const apolloOverrides: Plugin = ({ app }) => {
  // @ts-ignore
  app.apolloProvider.defaultClient.defaultOptions = {
    query: {
      fetchPolicy: 'no-cache',
    },
  }
}

export default apolloOverrides
