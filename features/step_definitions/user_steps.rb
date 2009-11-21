Given /^I am logged in as ([^ ]*)$/ do |user|
  login_as(user.to_sym)
  response.should contain("successful")
end

Given /^I am logged in$/ do
  login_as get_current_object_for(User)
end

Given /^I am not logged in$/ do
  visit logout_path
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
