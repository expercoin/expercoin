import Hello from '../../hello.vue';
import Split from '../../split.vue';
import App from '../../app.vue';
import Vue from 'vue/dist/vue.esm';
import vSelect from 'vue-select';

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
