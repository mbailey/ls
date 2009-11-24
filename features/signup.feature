Feature: Signup as a carer

  Scenario: New carer sign up
    Given I am on the carer signup page
    When I enter my details
    And I press "I accept"
    Then I should see "Submission was accepted"
