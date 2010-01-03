class CreateAnimalKinds < ActiveRecord::Migration
  def self.up
    create_table :animal_kinds do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :animal_kinds
  end
end
