class AddLatLngToCarer < ActiveRecord::Migration
  def self.up
    add_column :carers, :lat, :float
    add_column :carers, :lng, :float
  end

  def self.down
    remove_column :carers, :lng
    remove_column :carers, :lat
  end
end
