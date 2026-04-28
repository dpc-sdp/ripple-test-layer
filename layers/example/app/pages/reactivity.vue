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
        :message="alertMessage"
        :isDismissible="false"
      />
    </template>
    <template #primaryNav>
      <!-- #header - Primary nav goes here -->
      <RplPrimaryNav
        :primaryLogo="{ altText: 'Logo', href: '/' }"
        :items="primaryNav"
      >
      </RplPrimaryNav>
    </template>
    <template #breadcrumbs>
      <RplBreadcrumbs
        :items="[
          { text: 'Home', url: '/' },
          { text: 'Section', url: '/section' },
          { text: 'Page', url: '/section/page' }
        ]"
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
      <RplCardGrid :hasSidebar="Boolean(hasSidebar)" :columns="3">
        <RplPageComponent v-for="(card, idx) in dynamicCards" :key="`card-${idx}`">
          <RplPromoCard
            v-if="card.type === 'grant'"
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
          <RplPromoCard
            v-else
            el="li"
            v-bind="card"
            class="rpl-col-12 rpl-col-6-m rpl-col-4-l"
            :class="{ 'rpl-promo-card--disabled': card.type === 'notgrant' }"
          >
            <template #meta>
              <RplTag variant="neutral" label="Topic" />
              <RplIcon colour="success" name="icon-check-circle-filled" />
            </template>
            <RplContent :html="card.content" />
          </RplPromoCard>

        </RplPageComponent>
      </RplCardGrid>
    </template>
    <template #sidebar>
      <RplButton @click="handleButtonClick">Click me to change cards</RplButton>
      <RplButton @click="handleResetButtonClick" class="rpl-u-margin-t-4">Click me to reset cards</RplButton>
    </template>
    <template #belowBody>


    </template>

    <template #footer>
      <RplFooter :nav="footerNav" :links="footerLinks" />
    </template>
  </RplLayout>
</template>

<script setup lang="ts">
import {
  primaryNav,
  footerNav,
  footerLinks,
  heroHeader,
  cards
} from './../../data/nav'

const filteredCards = cards.filter((card) => card.id !== 'card-3')

const dynamicCards = ref([...cards])

const handleButtonClick = () => {
 dynamicCards.value.push({
    id: 'card-new',
    title: 'New Card',
    content: '<p>This is a new card added on button click.</p>',
    type: 'grant',
    url: 'https://www.example.com',
    image: {
      src: '/image.jpg',
      alt: 'image'
    }
  })
}

const handleResetButtonClick = () => {
  dynamicCards.value = [...cards]
}

const alertMessage = 'This is an EMERGENCY!!!! alert sdfs d sd'
</script>

<style lang="css">
.rpl-promo-card--disabled {
  opacity: 0.5;
  pointer-events: none;
}

</style>
