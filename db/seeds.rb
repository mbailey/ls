@v1 = Volunteer.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'one', 
  :address_1 => '1 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400111111',
  :email_address => 'v1@example.com'
)

@v2 = Volunteer.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'two', 
  :address_1 => '2 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400222222',
  :email_address => 'v2@example.com'
)

@v3 = Volunteer.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'three', 
  :address_1 => '3 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400333333',
  :email_address => 'v3@example.com'
)

@v4 = Volunteer.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'four', 
  :address_1 => 'Upstairs', 
  :address_2 => '4 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400444444',
  :email_address => 'v4@example.com'
)

@v5 = Volunteer.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'five', 
  :address_1 => '5 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400555555',
  :email_address => 'v5@example.com'
)

 

