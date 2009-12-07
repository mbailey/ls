class AttachHomeChecksToSignup < ActiveRecord::Migration
  def self.up
    rename_column :home_checks, :carer_id, :signup_id
  end

  def self.down
    rename_column :home_checks, :signup_id, :carer_id
  end
end
