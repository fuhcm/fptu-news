<template>
  <v-app>
    <v-toolbar app>
      <v-toolbar-title class="headline text-uppercase">
        <span>FPTU</span>
        <span class="font-weight-light">NEWS</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn flat href="https://fptu.tech" target="_blank">
        <span class="mr-2">Homepage</span>
      </v-btn>
    </v-toolbar>

    <v-content>
      <router-view></router-view>
    </v-content>
  </v-app>
</template>
