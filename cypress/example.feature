Feature: Render example

  Doesn't really do anything, please delete when you have something actually worth testing

  Background:
    Given the site endpoint returns fixture "/site/reference" with status 200
    And I am using a "macbook-16" device

  @mockserver
  Scenario: Page render
    Given the page endpoint for path "/example" returns fixture "/example/page" with status 200
    Then I visit the page "/example"
