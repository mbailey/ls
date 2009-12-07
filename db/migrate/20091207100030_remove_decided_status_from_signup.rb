class RemoveDecidedStatusFromSignup < ActiveRecord::Migration
  def self.up
    remove_column :signups, :decided_status
  end

  def self.down
    add_column :signups, :decided_status, :string
  end
end
