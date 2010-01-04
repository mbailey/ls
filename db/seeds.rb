require 'faker'

User.find_or_create_by_username(
  :first_name => 'admin',
  :last_name => 'account',
  :username => 'admin',
  :password => 'testing',
  :password_confirmation => 'testing',
  :email => 'admin@example.com'
)

@s1 = Signup.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'one', 
  :address_1 => '1 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400111111',
  :email_address => 'v1@example.com'
)

@s2 = Signup.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'two', 
  :address_1 => '2 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400222222',
  :email_address => 'v2@example.com'
)

@s3 = Signup.find_or_create_by_email_address(
  :first_name => 'user', 
  :last_name => 'three', 
  :address_1 => '3 The Street', 
  :suburb => 'Somewhereville', 
  :postcode => '3001', 
  :mobile_phone => '0400333333',
  :email_address => 'v3@example.com'
)

@capabilities = [ 
  'cage confinement',
  'recovering from surgery',
  'timid cats',
  'oral medication',
  'bandage changes',
  'no kids' ].collect {|c| Capability.find_or_create_by_name c }

@c1 = Carer.find_or_create_by_email_address(
  :first_name => 'John', 
  :last_name => 'Smith', 
  :address_1 => 'Upstairs', 
  :address_2 => '4 The Street', 
  :suburb => 'Lustawere', 
  :postcode => '3020', 
  :mobile_phone => '0400444444',
  :email_address => 'v4@example.com'
)
File.open('data/images/mike.jpg') { |image_file| @c1.image = image_file }
@c1.save
@c1.capabilities << Capability.first

@c2 = Carer.find_or_create_by_email_address(
  :first_name => 'Jane', 
  :last_name => 'Smith', 
  :address_1 => '12 Tapes Lane', 
  :suburb => 'Bentleigh', 
  :postcode => '3043', 
  :mobile_phone => '0408336276',
  :email_address => 'jane@example.com'
)
File.open('data/images/girl_sketch.jpg') { |image_file| @c2.image = image_file }
@c2.save
@c1.capabilities << Capability.last

@c3 = Carer.find_or_create_by_email_address(
  :first_name => 'Fred', 
  :last_name => 'Nerks', 
  :address_1 => 'Upstairs', 
  :address_2 => '4 The Street', 
  :suburb => 'Lustawere', 
  :postcode => '3020', 
  :mobile_phone => '0400444444',
  :email_address => 'c3@example.com'
)

100.times do
  c = Carer.find_or_create_by_email_address(
    :first_name => Faker::Name.first_name, 
    :last_name => Faker::Name.last_name, 
    :address_1 => Faker::Address.street_address, 
    :suburb => Faker::Address.uk_county, 
    :postcode => Faker.numerify('####'), 
    :mobile_phone => Faker.numerify('0400 ### ###'),
    :email_address => Faker::Internet.free_email
  )
end 

['Large Dog', 'Medium Dog', 'Small Dog', 'Puppy', 'Cat', 'Mum with kittens', 'Kittens', 'Other'].each do |animal_kind|
  AnimalKind.find_or_create_by_name(:name => animal_kind)
end

AnimalKind.all.each_with_index do |kind, i|
  Animal.find_or_create_by_animal_kind_id(:animal_kind_id => kind.id, :name => "animal_#{i}", :identifier => "#{i}")
end

Animal.first.capabilities = Capability.all
Animal.last.capabilities << Capability.first


 

