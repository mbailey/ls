class AddExperienceLevelToCarer < ActiveRecord::Migration
  def self.up
    add_column :carers, :experience_level, :string
  end

  def self.down
    remove_column :carers, :experience_level
  end
end
