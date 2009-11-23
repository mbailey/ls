Feature: Place an animal with a volunteer

  Background:
    Given a "user" exists
    And I am logged in

  Scenario: Search for volunteer who takes dogs
    Given a "takes_dogs" "volunteer" exists
    And a "takes_cats" "volunteer" exists
    And a "takes_dogs_and_cats" "volunteer" exists
    And I am on the placements page
    When I select "Dog" from "Kind"
    And I press "Search"
    Then I should see 2 "volunteers"
