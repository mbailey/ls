When /^I enter my details$/ do
  volunteer = Volunteer.make_unsaved
  fill_in "First name",    :with => volunteer.first_name
  fill_in "Last name",     :with => volunteer.last_name
  fill_in "Email address", :with => volunteer.email_address
  fill_in "Mobile phone",  :with => volunteer.mobile_phone
  fill_in "Home phone",    :with => volunteer.home_phone
  fill_in "Work phone",    :with => volunteer.work_phone
  fill_in "Address 1",     :with => volunteer.address_1
  fill_in "Address 2",     :with => volunteer.address_2
  fill_in "Suburb",        :with => volunteer.suburb
  fill_in "Postcode",      :with => volunteer.postcode
end
