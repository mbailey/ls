class AddCarerIdToSignup < ActiveRecord::Migration
  def self.up
    add_column :signups, :carer_id, :integer
  end

  def self.down
    remove_column :signups, :carer_id
  end
end
