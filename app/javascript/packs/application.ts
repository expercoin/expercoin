import './plugins_vue.ts';
import Vue from 'vue/dist/vue.esm';
import Hello from '../components/hello.vue';
import Split from '../components/split.vue';
import App from '../components/app.vue';
import toggleInput from '../components/toggleInput.vue';
import selectTest from '../components/selectTest.vue';
import modalTest from '../components/modalToggle.vue';

Vue.component('select-test', selectTest)
Vue.component('modal-toggle', modalTest)
Vue.component('app', App)
Vue.component('split', Split)
Vue.component('hello', Hello)
Vue.component('toggle-input', toggleInput)

document.addEventListener('turbolinks:load', () => {
  // const app = new Vue({
  //   el: '[data-behaviour="vue"]',
  // })
})
