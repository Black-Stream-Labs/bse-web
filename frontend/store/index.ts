import { GetterTree, ActionTree, MutationTree } from 'vuex'

export const state = () => ({
  things: [] as string[],
  name: 'Me',
  bgColor: null as any,
  fullColor: null as any,
  auth: {} as any,
})

export type RootState = ReturnType<typeof state>

export const getters: GetterTree<RootState, RootState> = {
  isAuthenticated: (state) => state.auth.loggedIn,
  loggedInUser: (state) => state.auth.user,
  name: (state) => state.name,
}

export const mutations: MutationTree<RootState> = {
  CHANGE_NAME: (state, newName: string) => (state.name = newName),
  UPDATE_BG_COLOR: (state, data: any) => {
    state.bgColor = data
      ? `background: linear-gradient(270deg, ${data[0]} 0%, ${data[1]} 100%)`
      : null
    state.fullColor = data ? { name: data[2], color: data[0] } : null
  },
}

export const actions: ActionTree<RootState, RootState> = {
  updateBgColor({ commit }, data) {
    commit('UPDATE_BG_COLOR', data)
  },
  // async fetchThings({ commit }) {
  //   const things = await this.$axios.$get('/things')
  //   console.log(things)
  //   commit('CHANGE_NAME', 'New name')
  // },
}
