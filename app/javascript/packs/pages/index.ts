import Hello from '../../components/hello.vue';
import Split from '../../components/split.vue';
import App from '../../components/app.vue';
import Vue from 'vue/dist/vue.esm';
import vSelect from 'vue-select';

Vue.component('v-select', vSelect)

document.addEventListener('turbolinks:load', () => {
  if(!document.querySelector("#root")) return;
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
