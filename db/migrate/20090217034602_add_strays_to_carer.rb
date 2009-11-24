class AddStraysToCarer < ActiveRecord::Migration
  def self.up
    add_column :carers, :will_take_stray, :boolean
  end

  def self.down
    remove_column :carers, :will_take_stray
  end
end
