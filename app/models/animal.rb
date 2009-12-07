class Animal < ActiveRecord::Base
  has_many :placements
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :icon => "32x32#" }  
  
  KINDS = ['Large Dog', 'Small Dog', 'Puppy', 'Cat', 'Mum with kittens', 'Kittens', 'Other']
  
  def current_placement
    placements.current.first
  end
  
  def placement_status
    current_placement? && current_placement.status
  end
  
end
