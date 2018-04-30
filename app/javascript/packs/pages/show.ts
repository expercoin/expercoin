import toggleInput from '../../components/toggleInput.vue';
import Vue from 'vue/dist/vue.esm';

document.addEventListener('turbolinks:load', () => {
  if(!document.querySelector("#pages-show")) return;
  const app = new Vue({
    el: '#pages-show',
    components: { toggleInput }
  })
})
