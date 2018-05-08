<template>
  <div>
    <h1 class="text-blue">teeeest</h1>
    <button @click='show'>Show Modal</button>
    <modal name="hello-world">
    <button @click='hide'>Hide Modal</button>
    <button @click='submit'>Submit Modal</button>
    <input v-model="selected">
    </modal>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selected: ''
    }
  },
  methods: {
    show () {
      this.$modal.show('hello-world');
    },
    hide () {
      this.$modal.hide('hello-world');
    },
    submit () {
      console.log('submit modal');
    }
  },
}
</script>

<style scoped>
.text-blue {
  color: blue;
}
</style>
