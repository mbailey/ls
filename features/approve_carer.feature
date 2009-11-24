Feature: Approve a carer

  Background:
    Given a "user" exists
    And I am logged in
    And an "pending" "carer" exists

  Scenario: Change carer status to approved
    Given I am on the details page for this carer
    When I follow "Edit"
    And I select "approved" from "Status"
    And I press "Update"
    Then this "carer" should be "approved"
