class AnimalsCapabilities < ActiveRecord::Migration
  def self.up
    create_table :animals_capabilities, :id => false do |t|
      t.references :animal, :capability
    end
  end

  def self.down
    drop_table :animals_capabilities
  end
end
