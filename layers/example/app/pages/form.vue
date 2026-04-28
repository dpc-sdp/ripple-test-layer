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
      <h2 class="rpl-type-h2">This is a form</h2>
      <p class="rpl-type-p">This is a form to test the RplForm and RplFormElement components.</p>
      <RplPageComponent>
        <RplForm id="testform" title="Test form">
          <RplFormElement type="RplFormText" label="text" help="This is help text" />
          <RplFormElement type="RplFormDate" label="date" />
          <RplFormElement type="RplFormDropdown" label="date" :options="dropDownOptions" />
          <RplFormElement type="RplFormActions" label="Submit form" />

          <template #belowForm="{ value }">
            <div class="rpl-storybook-form-values rpl-u-margin-t-6">
              <h2 class="rpl-type-h4">Internal form values</h2>
              <pre wrap>{{ value }}</pre>
            </div>
          </template>
        </RplForm>
      </RplPageComponent>
    </template>
    <template #sidebar>
      <span />
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

const alertMessage = 'This is an EMERGENCY!!!! alert sdfs d sd'

const dropDownOptions = [
  { id: 'apple', value: 'apple', label: 'Apple' },
  { id: 'banana', value: 'banana', label: 'Banana' },
  { id: 'orange', value: 'orange', label: 'Orange' },
  { id: 'strawberry', value: 'strawberry', label: 'Strawberry' },
  { id: 'apricots', value: 'apricots', label: 'Apricots' },
  { id: 'grapes', value: 'grapes', label: 'Grapes' },
  { id: 'pineapple', value: 'pineapple', label: 'Pineapple' },
  { id: 'sultana', value: 'sultana', label: 'Sultana' },
  { id: 'blueberries', value: 'blueberries', label: 'Blueberries' },
  { id: 'avocado', value: 'avocado', label: 'Avocado' },
  { id: 'peach', value: 'peach', label: 'Peach' },
  { id: 'lemon', value: 'lemon', label: 'Lemon' },
  { id: 'watermelon', value: 'watermelon', label: 'Watermelon' }
]
</script>

<style lang="css">
.rpl-promo-card--disabled {
  opacity: 0.5;
  pointer-events: none;
}

</style>
