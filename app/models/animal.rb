class Animal < ActiveRecord::Base
  has_many :placements
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :icon => "32x32#" }  
  
  KINDS = ['Large Dog', 'Small Dog', 'Puppy', 'Cat', 'Mum with kittens', 'Kittens', 'Other']
  
  def current_placement
    placements.current.first || Placement.new(:animal => self)
  end
  
  def current_placement?
    ! current_placement.blank?
  end
  
  def placement_status
    current_placement? && current_placement.status
  end
  
end
