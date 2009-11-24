class AddDogSafeGatesToCarer < ActiveRecord::Migration
  def self.up
    add_column :carers, :dog_safe_gates, :string
  end

  def self.down
    remove_column :carers, :dog_safe_gates
  end
end
