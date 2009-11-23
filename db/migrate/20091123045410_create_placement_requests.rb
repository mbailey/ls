class CreatePlacementRequests < ActiveRecord::Migration
  def self.up
    create_table :placement_requests do |t|
      t.integer :placement_id
      t.integer :volunteer_id
      t.datetime :request_date
      t.string :request_method
      t.text :request_msg
      t.datetime :response_date
      t.string :response_method
      t.text :response_msg
      t.string :response_type
      t.datetime :followup_date
      t.string :followup_method
      t.text :followup_msg
      t.string :followup_type

      t.timestamps
    end
  end

  def self.down
    drop_table :placement_requests
  end
end
