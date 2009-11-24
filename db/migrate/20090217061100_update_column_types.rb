class UpdateColumnTypes < ActiveRecord::Migration
  def self.up
    change_column :carers, :dog_safe_gates, :boolean
    remove_column :carers, :can_administer_medical
  end
  
  def self.down
    change_column :carers, :dog_safe_gates, :string
    add_column :carers, :can_administer_medical, :string
  end
end
