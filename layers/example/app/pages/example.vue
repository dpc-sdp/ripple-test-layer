<template>
  <RplLayout
    background="default"
    :showBackToTop="true"
    side-bar-placement="right"
  >
    <template #aboveHeader>
      <!-- #header - Above header goes here -->
    </template>
    <template #primaryNav>
      <!-- #header - Primary nav goes here -->
    </template>
    <template #breadcrumbs>
    </template>
    <template #aboveBody="{ hasBreadcrumbs }">

    </template>
    <template #body="{ hasSidebar }">

    </template>
    <template #belowBody> </template>
    <template #footer>
    </template>
  </RplLayout>
</template>

<script setup lang="ts">
// import { primaryNav, footerNav, footerLinks, heroHeader, cards } from './../../data/nav'

</script>
