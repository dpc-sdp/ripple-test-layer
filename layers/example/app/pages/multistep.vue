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
      <h2>This is a form</h2>
      <RplForm id="testform" title="Test form" :schema="formSchema" @submit="onSubmit">
        <template #belowForm="{ value }">
          <div class="rpl-storybook-form-values rpl-u-margin-t-6">
            <h2 class="rpl-type-h4">Internal form values</h2>
            <pre wrap>{{ value }}</pre>
          </div>
        </template>
      </RplForm>
    </template>
    <template #belowBody> </template>

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
  heroHeader
} from './../../data/nav'

import { formSchema } from '../../data/multistepform';

const alertMessage = 'This is an EMERGENCY!!!! alert sdfs d sd'

const onSubmit = (formData: any) => {
  console.log('Form submitted with data:', formData);
  alert(`Form submitted with data: ${JSON.stringify(formData)}`);
}

</script>

<style lang="css">
.rpl-promo-card--disabled {
  opacity: 0.5;
  pointer-events: none;
}

</style>
