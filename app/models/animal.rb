class Animal < ActiveRecord::Base
  has_many :placements
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :icon => "50x50#" }  
  
  KINDS = ['Large Dog', 'Medium Dog', 'Small Dog', 'Puppy', 'Cat', 'Mum with kittens', 'Kittens', 'Other']
  
  named_scope :limit, lambda { |num| { :limit => num } }
  
  def current_placement
    placements.current.first
  end
  
  def placement_status
    current_placement && current_placement.status
  end
  
  def subtitle
    kind
  end
  
end
