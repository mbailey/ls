class CapabilitiesPlacements < ActiveRecord::Migration
  def self.up
    create_table :capabilities_placements, :id => false do |t|
      t.references :placement, :capability
    end
  end

  def self.down
    drop_table :capabilities_placements
  end
end
