<template>
  <div>
    <v-select v-model="selected" :options="options" :name="name"></v-select>
    <input type="text" v-model="selected">
  </div>
</template>

<script>
import vSelect from 'vue-select';

export default {
  data: function () {
    return {
      selected: ''
    }
  },
  props: {
    options: {
      type: Array,
      required: true
    },
    name: {
      type: String
    }
  },
  components: {
    vSelect
  }
}
</script>

<style scoped>
</style>
