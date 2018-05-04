import './plugins_vue.ts';
import Vue from 'vue/dist/vue.esm';
import Hello from '../components/hello.vue';
import Split from '../components/split.vue';
import App from '../components/app.vue';
import toggleInput from '../components/toggleInput.vue';
import vSelect from 'vue-select';

Vue.component('v-select', vSelect)
Vue.component('app', App)
Vue.component('split', Split)
Vue.component('hello', Hello)
Vue.component('toggle-input', toggleInput)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behaviour="vue"]',
    data: {
      selected: ''
    },
    methods: {
      show() {
      },
      hide() {
      },
      submit() {
      }
    }
  })
})
