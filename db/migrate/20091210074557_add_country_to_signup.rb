class AddCountryToSignup < ActiveRecord::Migration
  def self.up
    add_column :signups, :country, :string, :default => 'Australia'
    add_column :carers, :country, :string, :default => 'Australia'
  end

  def self.down
    remove_column :signups, :country
    remove_column :carers, :country
  end
end
