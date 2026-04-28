<template>
  <RplLayout
    background="default"
    :showBackToTop="true"
    side-bar-placement="right"
  >
    <template #aboveHeader>
      <!-- #header - Above header goes here -->
      <RplIconSprite />
      <RplAlert
        alertId="alert"
        message="This is an informational alert"
        :isDismissible="false"
      />
    </template>
    <template #primaryNav>
      <!-- #header - Primary nav goes here -->
      <RplPrimaryNav
        :primaryLogo="{ altText: 'Logo', href: '/' }"
        :items="primaryNav"
      />
    </template>
    <template #breadcrumbs>
      <RplBreadcrumbs
        :items="[{ text: 'Home', url: '/' }]"
        :besideQuickExit="true"
      />
    </template>
    <template #aboveBody="{ hasBreadcrumbs }">
      <RplHeroHeader
        :breadcrumbs="hasBreadcrumbs"
        :behindNav="true"
        v-bind="heroHeader"
      >
        {{ heroHeader.summary }}
      </RplHeroHeader>
    </template>
    <template #body="{ hasSidebar }">
      <RplPageComponent> </RplPageComponent>
      <RplCardGrid :hasSidebar="Boolean(hasSidebar)" :columns="3">
        <RplPageComponent v-for="(card, idx) in cards" :key="idx">
          <RplPromoCard
            el="li"
            v-bind="card"
            class="rpl-col-12 rpl-col-6-m rpl-col-4-l"
          >
            <template #meta>
              <RplTag variant="neutral" label="Topic" />
              <RplIcon colour="success" name="icon-check-circle-filled" />
              <span>Open</span>
            </template>
            <RplContent :html="card.content" />
          </RplPromoCard>
        </RplPageComponent>
      </RplCardGrid>
    </template>
    <template #belowBody> </template>
    <template #footer>
      <RplFooter :nav="footerNav" :links="footerLinks" />
    </template>
  </RplLayout>
</template>

<script setup lang="ts">
import { primaryNav, footerNav, footerLinks, heroHeader, cards } from './../../data/nav'

</script>
