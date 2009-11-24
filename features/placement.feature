Feature: Place an animal with a carer

  Background:
    Given a "user" exists
    And I am logged in

  Scenario: Search for carer who takes dogs
    Given a "takes_dogs" "carer" exists
    And a "takes_cats" "carer" exists
    And a "takes_dogs_and_cats" "carer" exists
    And I am on the placements page
    When I select "Dog" from "Kind"
    And I press "Search"
    Then I should see 2 "carers"
