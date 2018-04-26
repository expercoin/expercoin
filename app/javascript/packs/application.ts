import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import App from '../app.vue'
import Hello from '../hello.vue'
import Split from '../split.vue'

Vue.use(TurbolinksAdapter)
Vue.use(Vuex)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#root',
    data: {
      message: "Im Root Component I call components"
    },
    components: { App, Hello, Split }
  })
})
