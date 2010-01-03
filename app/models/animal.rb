class Animal < ActiveRecord::Base
  
  KINDS = ['Large Dog', 'Medium Dog', 'Small Dog', 'Puppy', 'Cat', 'Mum with kittens', 'Kittens', 'Other']
  
  has_many :placements
  has_and_belongs_to_many :capabilities, :uniq => true
  belongs_to :animal_kind
  has_attached_file :image, 
    :styles => { :medium => "300x300>", :thumb => "100x100>", :icon => "50x50#" },
    :default_url => "/images/default/:style/missing_dog.jpg"
  
  named_scope :limit, lambda { |num| { :limit => num } }
  
  validates_uniqueness_of :identifier
  validates_presence_of :animal_kind
  
  def current_placement
    placements.current.first
  end
  
  def placement_status
    current_placement && current_placement.status
  end
  
  def kind
    animal_kind.name if animal_kind
  end
  
  def subtitle
    kind
  end
  
end
