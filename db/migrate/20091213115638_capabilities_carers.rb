class CapabilitiesCarers < ActiveRecord::Migration
  def self.up
    create_table :capabilities_carers, :id => false do |t|
      t.references :carer, :capability
    end
  end

  def self.down
    drop_table :capabilities_carers
  end
end
