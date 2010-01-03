class AnimalKind < ActiveRecord::Base
  
  has_one :carer
  has_one :animal
  
  validates_uniqueness_of :name
  
  # Large Dog
  # Medium Dog
  # Small Dog
  # Puppy
  # Cat
  # Mum with kittens
  # Kittens
  # Other

end
