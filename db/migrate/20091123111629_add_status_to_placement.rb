class AddStatusToPlacement < ActiveRecord::Migration
  def self.up
    add_column :placements, :status, :string, :default => 'seeking_carer'
  end

  def self.down
    remove_column :placements, :status
  end
end
