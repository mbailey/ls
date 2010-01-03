class RenamePlacementRequestsToInvitations < ActiveRecord::Migration
  def self.up
    rename_table :placement_requests, :invitations rescue nil # oops! I updated old migration
  end

  def self.down
    rename_table :invitations, :placement_requests
  end
end
