class Capability < ActiveRecord::Base
  has_and_belongs_to_many :carers, :uniq => true
  has_and_belongs_to_many :animals, :uniq => true
  has_and_belongs_to_many :placements, :uniq => true
end
