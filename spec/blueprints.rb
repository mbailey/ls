require 'machinist/active_record'
require 'sham'
require 'faker'

Carer.blueprint do
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

    # t.integer  "can_keep_dogs"
    # t.integer  "can_keep_cats"
    # t.string   "can_keep_other"
    # t.boolean  "can_keep_inside_initially"
    # t.boolean  "can_sleep_inside_ongoing"
    # t.integer  "dogs_owned"
    # t.integer  "cats_owned"
    # t.string   "other_owned"
    # t.integer  "hours_spent_at_home_per_day"
    # t.integer  "children"
    # t.string   "children_ages"
    # t.boolean  "can_transport"
    # t.boolean  "requires_financial_support"
    # t.integer  "offer_duration"
    # t.boolean  "will_take_stray"
    # t.string   "how_secure"
    # t.boolean  "dog_safe_gates",              :limit => 255
    # t.string   "special_skills"
    # t.boolean  "can_administer_medical_care"

Carer.blueprint(:takes_dogs) do
  state 'approved'
  can_keep_dogs true
end

Carer.blueprint(:takes_cats) do
  state 'approved'
  can_keep_cats true
end

Carer.blueprint(:takes_dogs_and_cats) do
  state 'approved'
  can_keep_dogs true
  can_keep_cats true
end

User.blueprint do
  username  { Faker::Internet.user_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password 'testing1'
  password_confirmation 'testing1'
end
