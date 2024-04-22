```js
<template>
  <div class="home">
    <div>
      <button @click="decreaseCounter" class="btn">-</button>
      <span class="counter">{{ counter }}</span>
      <button @click="increaseCounter" class="btn">+</button>
    </div>
  </div>
</template>

<!-- Vue.js 2 -->
<script>
  export default {
    data() {
      return {
        counter: 0
      }
    },
    methods: {
      increaseCounter() {
        this.counter++
      },
      decreaseCounter() {
        this.counter--
      }
    }
  }
</script>

<!-- Vue.js 3.0 -->
<script>
  import { ref } from 'vue'
  
  export default {
    setup() {
      const counter = ref(0)
      
      const increaseCounter = () => {
        counter.value++
      }
      
      const decreaseCounter = () => {
        counter.value--
      }
      
      return {
        counter,
        increaseCounter,
        decreaseCounter
      }
    }
  }
</script>

<!-- Vue.js 3.2+ -->
<script setup>
  import { ref } from 'vue'
  
  const counter = ref(0)
  
  const increaseCounter = () => {
    counter.value++
  }
  
  const decreaseCounter = () => {
    counter.value--
  }
</script>

<style>
.home {
  text-align: center;
  padding: 20px;
}
.btn, .counter {
  font-size: 40px;
  margin: 10px;
}
</style>
```