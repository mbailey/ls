class AddVolunteerState < ActiveRecord::Migration
  def self.up
    add_column :volunteers, :state, :string, :default => 'pending'
  end

  def self.down
    remove_column :volunteers, :state
  end
end
