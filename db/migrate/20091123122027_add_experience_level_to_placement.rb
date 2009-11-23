class AddExperienceLevelToPlacement < ActiveRecord::Migration
  def self.up
    add_column :placements, :experience_level, :string
  end

  def self.down
    remove_column :placements, :experience_level
  end
end
