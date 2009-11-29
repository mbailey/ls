When /^I enter my details$/ do
  carer = Carer.make_unsaved
  fill_in "First name",    :with => carer.first_name
  fill_in "Last name",     :with => carer.last_name
  fill_in "Email address", :with => carer.email_address
  fill_in "Mobile phone",  :with => carer.mobile_phone
  fill_in "Home phone",    :with => carer.home_phone
  fill_in "Work phone",    :with => carer.work_phone
  fill_in "Address 1",     :with => carer.address_1
  fill_in "Address 2",     :with => carer.address_2
  fill_in "Suburb",        :with => carer.suburb
  fill_in "Postcode",      :with => carer.postcode
end
