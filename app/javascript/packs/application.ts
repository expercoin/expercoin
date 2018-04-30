import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import App from '../app.vue'
import Hello from '../hello.vue'
import Split from '../split.vue'
import VModal from 'vue-js-modal'
import vSelect from 'vue-select'

Vue.use(VModal)
Vue.use(TurbolinksAdapter)
Vue.use(Vuex)

Vue.component('v-select', vSelect)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#root',
    data: {
      message: "Im Root Component I call components",
      selected: 'value'
    },
    methods: {
      show () {
        this.$modal.show('hello-world');
      },
      hide () {
        this.$modal.hide('hello-world');
      },
      submit () {
        console.log('submit');
        this.$modal.hide('hello-world');
      }
    },
    components: { App, Hello, Split }
  })
})
