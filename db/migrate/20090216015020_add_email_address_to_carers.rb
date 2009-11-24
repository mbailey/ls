class AddEmailAddressToCarers < ActiveRecord::Migration
  def self.up
    add_column :carers, :email_address, :string
  end

  def self.down
    remove_column :carers, :email_address
  end
end
