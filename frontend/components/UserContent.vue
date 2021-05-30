<template>
  <div class="content">
    <p>
      username: <strong>{{ user.username }}</strong>
    </p>
    <p>
      email: <strong>{{ user.email }}</strong>
    </p>
    <p>
      status:
      <strong>{{
        user.confirmed ? 'account confirmed' : 'account not confirmed yet'
      }}</strong>
    </p>
    <p>
      last info update:
      <strong>{{ new Date(user.updated_at).toLocaleString() }}</strong>
    </p>
  </div>
</template>

<script>
export default {
  name: 'UserContent',
  layout: 'DefaultLayout',
  middleware: 'auth',
  props: {
    user: {
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {
      userHistory: [],
      userPurchases: [],
    }
  },

  computed: {},
}
</script>

<style></style>
