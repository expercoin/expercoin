<template>
  <div id="toggle-input">
    <transition name="fade"  :duration="{ enter: 500, leave: 200 }">
      <input v-model="value" v-show="active" data-test="input" />
    </transition>
    <button @click="active = !active" v-show="active" data-test="hide">Hide</button>
    <button @click="active = !active" v-show="!active" data-test="show">Show</button>
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