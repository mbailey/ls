class CreateAnimalKindsCarers < ActiveRecord::Migration
  def self.up
    create_table :animal_kinds_carers, :id => false do |t|
      t.references :animal_kind, :carer
    end
  end

  def self.down
    drop_table :animal_kinds_carers
  end
end
