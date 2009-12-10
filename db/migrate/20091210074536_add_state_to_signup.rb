class AddStateToSignup < ActiveRecord::Migration
  def self.up
    add_column :signups, :state, :string
    add_column :carers, :state, :string
  end

  def self.down
    remove_column :signups, :state
    remove_column :carers, :state
  end
end
