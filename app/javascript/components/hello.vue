<template>
  <div id="hello">
    <p>{{ message }}</p>
    <input v-model="number" />
    <button  v-on:click="increment">Click me</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Now!",
      number: 0
    }
  },
  methods: {
    increment: function () {
      this.number = 1;
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
