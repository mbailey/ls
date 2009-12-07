class AddFieldsToSignup < ActiveRecord::Migration
  def self.up
    add_column :signups, :decided_by, :integer
    add_column :signups, :decided_on, :datetime
    add_column :signups, :decided_notes, :text
    add_column :signups, :decided_status, :string
  end

  def self.down
    remove_column :signups, :decided_status
    remove_column :signups, :decided_notes
    remove_column :signups, :decided_on
    remove_column :signups, :decided_by
  end
end
