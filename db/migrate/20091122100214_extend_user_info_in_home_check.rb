class ExtendUserInfoInHomeCheck < ActiveRecord::Migration
  def self.up
    rename_column :home_checks, :user_id, :booked_by_id
    add_column :home_checks, :performed_by_id, :integer
  end

  def self.down
    rename_column :home_checks, :booked_by_id,  :user_id
    remove_column :home_checks, :performed_by_id    
  end
end
