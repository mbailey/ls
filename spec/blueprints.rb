require 'machinist/active_record'
require 'sham'
require 'faker'

Volunteer.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  address_1 { Faker::Address.street_address }
  address_2 { Faker::Address.secondary_address }
  suburb { Faker::Address.city }
  postcode { Faker.numerify '####' }
  mobile_phone { Faker.numerify '614## ### ###' }
  home_phone { Faker.numerify '613 #### ####' }
  work_phone { Faker.numerify '613 #### ####' }
  email_address { Faker::Internet.email }
end

User.blueprint do
  username  { Faker::Internet.user_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password 'testing1'
  password_confirmation 'testing1'
end
