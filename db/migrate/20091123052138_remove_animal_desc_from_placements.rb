class RemoveAnimalDescFromPlacements < ActiveRecord::Migration
  def self.up
    remove_column :placements, :animal_desc
  end

  def self.down
    add_column :placements, :animal_desc, :string
  end
end
