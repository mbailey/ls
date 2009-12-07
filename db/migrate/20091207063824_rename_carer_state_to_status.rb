class RenameCarerStateToStatus < ActiveRecord::Migration
  def self.up
    rename_column :carers, :state, :status
  end

  def self.down
    rename_column :carers, :status, :state
  end
end
