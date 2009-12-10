class AddDetailsToAnimal < ActiveRecord::Migration
  def self.up
    add_column :animals, :sex, :string
    add_column :animals, :age, :string
    add_column :animals, :color, :string
    add_column :animals, :breed, :string
  end

  def self.down
    remove_column :animals, :breed
    remove_column :animals, :color
    remove_column :animals, :age
    remove_column :animals, :sex
  end
end
