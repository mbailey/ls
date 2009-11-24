class CreateHomeChecks < ActiveRecord::Migration
  def self.up
    create_table :home_checks do |t|
      t.integer :user_id
      t.integer :carer_id
      t.datetime :scheduled_at
      t.boolean :completed
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :home_checks
  end
end
