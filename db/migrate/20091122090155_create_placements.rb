class CreatePlacements < ActiveRecord::Migration
  def self.up
    create_table :placements do |t|
      t.string :animal_id
      t.string :animal_desc
      t.integer :volunteer_id
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :placements
  end
end
