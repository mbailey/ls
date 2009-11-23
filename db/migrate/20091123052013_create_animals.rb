class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
      t.string :name
      t.string :identifier
      t.string :kind
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :animals
  end
end
