class AddCarerState < ActiveRecord::Migration
  def self.up
    add_column :carers, :state, :string, :default => 'pending'
  end

  def self.down
    remove_column :carers, :state
  end
end
