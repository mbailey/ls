class AddAnimalKindIdToAnimal < ActiveRecord::Migration
  def self.up
    add_column :animals, :animal_kind_id, :integer
  end

  def self.down
    remove_column :animals, :animal_kind_id
  end
end
