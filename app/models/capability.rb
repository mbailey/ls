class Capability < ActiveRecord::Base
  has_and_belongs_to_many :carers, :uniq => true
  has_and_belongs_to_many :animals, :uniq => true
  has_and_belongs_to_many :placements, :uniq => true
  
  validates_uniqueness_of :name
  
  # Special requirements
  #   cage confinement
  #   recovering from surgery
  #   timid cats
  #   oral medication
  #   bandage changes
  
  #   no kids
end
