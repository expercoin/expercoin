<template>
  <div id="toggle-input">
    <transition name="fade"  :duration="{ enter: 500, leave: 200 }">
      <input v-model="value" v-show="active" aria-label="input" />
    </transition>
    <button @click="toggle" v-show="active" aria-label="hide">Hide</button>
    <button @click="toggle" v-show="!active" aria-label="show">Show</button>
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
    toggle() {
      this.active = !this.active;
    }
  }
}
</script>

<style scoped>
</style>
