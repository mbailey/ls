class AddHowSecureToCarers < ActiveRecord::Migration
  def self.up
    add_column :carers, :how_secure, :string
  end

  def self.down
    remove_column :carers, :how_secure
  end
end
