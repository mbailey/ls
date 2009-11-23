class AddExperienceLevelToVolunteer < ActiveRecord::Migration
  def self.up
    add_column :volunteers, :experience_level, :string
  end

  def self.down
    remove_column :volunteers, :experience_level
  end
end
