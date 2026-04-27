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
import { primaryNav, footerNav, footerLinks } from './../../data/nav'


const heroHeader = {
  title: 'Find, connect, shape your Victoria',
  summary:
    "Access grants and services, find out what's on in Victoria and have your say on government decisions.",
  links: {
    title: 'Popular searches',
    items: [
      { text: 'Jobs and careers', url: '#first' },
      { text: 'Working with Children Check', url: '#second' },
      { text: 'NDIS Worker Screening Check', url: '#third' },
      { text: 'Contact the Victorian Government', url: '#fourth' }
    ]
  }
}

const cards = [
  {
    url: 'https://www.vic.gov.au',
    title: 'Small Business Ventilation Program',
    image: {
      src: '/image.jpg',
      alt: 'image'
    },
    content:
      '<p>Funding for public-facing small businesses to purchase equipment and upgrades to improve ventilation and reduce the spread of COVID-19 and boost customer confidence.</p>'
  },
  {
    url: 'https://www.vic.gov.au',
    title: 'Small Business Ventilation Program',
    image: {
      src: '/image.jpg',
      alt: 'image'
    },
    content:
      '<p>Funding for public-facing small businesses to purchase equipment and upgrades to improve ventilation and reduce the spread of COVID-19 and boost customer confidence.</p>'
  },
  {
    url: 'https://www.vic.gov.au',
    title: 'Small Business Ventilation Program',
    image: {
      src: '/image.jpg',
      alt: 'image'
    },
    content:
      '<p>Funding for public-facing small businesses to purchase equipment and upgrades to improve ventilation and reduce the spread of COVID-19 and boost customer confidence.</p>'
  }
]
</script>
