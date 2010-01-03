class AnimalKind < ActiveRecord::Base
  
  has_many :carers
  has_many :animals
  
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
