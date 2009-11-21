Given /^I am logged in as ([^ ]*)$/ do |user|
  login_as(user.to_sym)
  response.should contain("successful")
end

Given /^I am logged in as an? "([^\"]*)"$/ do |role|
  login_as(role)
  response.should contain("successful")
end

Given /^an? "([^\"]*)" user$/ do |role|
  set_current_object_for(User, User.make(role.to_sym))
end

Given /^I log in as ([^ ]*)$/ do |user|
  Given "I am logged in as #{user}"
end

Given /^I am logged in$/ do
  login_as get_current_object_for(User)
end

Given /^I am not logged in$/ do
  visit logout_path
end

Given /^I have received a login details email$/ do
  user = get_current_object_for(User)
  UserMailer.deliver_login_details(user)
  @last_email_address = user.email
  Then 'I should receive an email'
end

When /^I login with correct login details$/ do
  login_as get_current_object_for(User)
end

When /^I login with incorrect login details$/ do
  visit new_user_session_path
  fill_in 'username', :with => get_current_object_for(User).username
  fill_in 'password', :with => 'zzz'
  click_button
end

When /^I enter a users details$/ do
  user = set_current_object_for(User, User.make_unsaved)
  fill_in 'Username', :with => user.username
  fill_in 'First Name', :with => user.first_name
  fill_in 'Last Name', :with => user.last_name
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  fill_in 'Password Confirmation', :with => user.password_confirmation
end

When /^I enter an? admin users details$/ do
  user = set_current_object_for(User, User.make_unsaved)
  fill_in 'Username', :with => user.username
  fill_in 'First Name', :with => user.first_name
  fill_in 'Last Name', :with => user.last_name
  fill_in 'Email', :with => user.email
  check 'Make Admin'
  fill_in 'Password', :with => user.password
  fill_in 'Password Confirmation', :with => user.password_confirmation
end

When /^I follow "([^\"]*)" for user (\d+)$/ do |action, id|
  click_link("/users/#{id}/#{action.dehumanize}")
end

When /^I follow "([^\"]*)" for this user$/ do |action|
  When "I follow \"#{action}\" for user #{@current_user.id}"
end

When /^I click my name$/ do
  When %Q{I follow "#{@user.full_name}"}
end

When /^I follow the activation URL$/ do
  When 'I open the email'
  When 'I click the first link in the email'
end

Then /^I should be taken to (.*)$/ do |page_name|
  Then "I should be on the #{page_name}"
end

Then /^this user should receive a login details email$/ do
  @last_email_address = get_current_object_for(User).email
  Then 'I should receive an email'
  When 'I open the email'
  Then 'I should see "Login Details" in the email subject'
  And 'I should see "username" in the email body'
end

Then /^my account should have an? "([^\"]*)" of "([^\"]*)"$/ do |attribute, value|
  logged_in_user.reload
  logged_in_user.send(attribute).should == value
end

Then /^I should receive a password reset email$/ do
  @last_email_address = get_current_object_for(User).email
  Then 'I should receive an email'
  When 'I open the email'
  Then 'I should see "Password Reset" in the email subject'
end

Then /^my account should be active$/ do
  user = get_current_object_for(User)
  user.reload
  user.active?.should be_true
end
