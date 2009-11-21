Feature: Signup as a volunteer

  Scenario: New volunteer sign up
    Given I am on the volunteer signup page
    When I enter my details
    And I press "I accept"
    Then I should see "Submission was accepted"
