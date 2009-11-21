Feature: Approve a volunteer

  Background:
    Given a "user" exists
    And I am logged in
    And an "pending" "volunteer" exists

  Scenario: Change volunteer status to approved
    Given I am on the details page for this volunteer
    When I follow "Edit"
    And I select "approved" from "Status"
    And I press "Update"
    Then this "volunteer" should be "approved"
