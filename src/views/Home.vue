<template>
  <v-layout>
    <v-flex xs12 sm6 offset-sm3 mt-3>
      <p v-if="loading">Loading...</p>
      <p v-if="errored">Error!</p>

      <v-card
        class="card-item"
        v-for="post in listBatched"
        v-bind:key="post.guid"
      >
        <v-img :src="post.thumbnail">
          <v-container fill-height fluid pa-2>
            <v-layout fill-height>
              <v-flex xs12 align-end flexbox>
                <a :href="post.guid" target="_blank">
                  <span
                    class="headline white--text black"
                    v-text="post.title"
                  ></span>
                </a>
              </v-flex>
            </v-layout>
          </v-container>
        </v-img>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn icon>
            <v-icon>favorite</v-icon>
          </v-btn>
          <v-btn icon>
            <v-icon>bookmark</v-icon>
          </v-btn>
          <v-btn icon>
            <v-icon>share</v-icon>
          </v-btn>
        </v-card-actions>
      </v-card>

      <div class="text-xs-center" style="margin-bottom: 1rem;">
        <v-btn round color="primary" dark v-on:click="loadMore"
          >Load more posts</v-btn
        >
      </div>
    </v-flex>
  </v-layout>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      posts: [],
      loading: true,
      errored: false,
      batch: 10
    };
  },
  computed: {
    listBatched: function() {
      return this.posts.slice(0, this.batch);
    }
  },
  methods: {
    loadMore: function() {
      this.batch += 10;
    }
  },
  mounted() {
    axios
      .get("https://api.fptu.tech/crawl/medium")
      .then(response => {
        this.posts = response.data;
        this.loading = false;
      })
      .catch(error => {
        this.errored = true;
        this.loading = false;
        console.log(error);
      })
      .finally(() => {
        this.loading = false;
      });
  }
};
</script>

<style>
.card-item {
  margin-bottom: 1rem;
}
</style>
