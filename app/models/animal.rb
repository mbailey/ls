class Animal < ActiveRecord::Base
  has_many :placements
  
  has_attached_file :photo#, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  KINDS = ['Dog', 'Puppy', 'Cat', 'Cat with kittens', 'Kittens', 'Injured Dog', 'Injured Cat', 'Other']
end
