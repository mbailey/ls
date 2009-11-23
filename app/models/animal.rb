class Animal < ActiveRecord::Base
  has_many :placements
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :icon => "32x32#" }  
  
  KINDS = ['Dog', 'Puppy', 'Cat', 'Cat with kittens', 'Kittens', 'Injured Dog', 'Injured Cat', 'Other']
end
