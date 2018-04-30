<template>
  <div id="toggle-input">
    <transition name="fade"  :duration="{ enter: 500, leave: 200 }">
      <input v-model="value" v-show="active" />
    </transition>
    <button @click="active = !active" v-show="active">Hide</button>
    <button @click="active = !active" v-show="!active">Show</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      value: "",
      active: true
    }
  },
  methods: {
  }
}
</script>

<style scoped>
</style>