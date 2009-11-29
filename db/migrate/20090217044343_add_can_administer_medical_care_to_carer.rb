class AddCanAdministerMedicalCareToCarer < ActiveRecord::Migration
  def self.up
    add_column :carers, :can_administer_medical_care, :boolean
  end

  def self.down
    remove_column :carers, :can_administer_medical_care
  end
end
