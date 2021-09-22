<template>
  <div>
    <div v-for="asset in assets" v-bind:key="asset.name">
      <h1>{{ asset.name }}</h1>
      <p>{{ asset.last_sale }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      assets: [],
    };
  },

  methods: {
    async getAssets() {
      const response = await this.axios.get("http://localhost:4000/api/assets");
      this.assets = response.data.assets;
    },
  },

  created() {
    this.getAssets();
  },
};
</script>
