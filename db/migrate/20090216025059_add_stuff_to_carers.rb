class AddStuffToCarers < ActiveRecord::Migration
  def self.up
    add_column :carers, :can_keep_dogs, :integer
    add_column :carers, :can_keep_cats, :integer
    add_column :carers, :can_keep_other, :string
    add_column :carers, :can_keep_inside_initially, :boolean
    add_column :carers, :can_sleep_inside_ongoing, :boolean
    add_column :carers, :dogs_owned, :integer
    add_column :carers, :cats_owned, :integer
    add_column :carers, :other_owned, :string
    add_column :carers, :hours_spent_at_home_per_day, :integer
    add_column :carers, :children, :integer
    add_column :carers, :children_ages, :string
    add_column :carers, :can_transport, :boolean
    add_column :carers, :requires_financial_support, :boolean
    add_column :carers, :can_administer_medical, :boolean
    add_column :carers, :offer_duration, :integer
  end

  def self.down
    remove_column :carers, :offer_duration
    remove_column :carers, :can_administer_medical
    remove_column :carers, :requires_financial_support
    remove_column :carers, :can_transport
    remove_column :carers, :children_ages
    remove_column :carers, :children
    remove_column :carers, :hours_spent_at_home_per_day
    remove_column :carers, :other_owned
    remove_column :carers, :cats_owned
    remove_column :carers, :dogs_owned
    remove_column :carers, :can_sleep_inside_ongoing
    remove_column :carers, :can_keep_inside_initially
    remove_column :carers, :can_keep_other
    remove_column :carers, :can_keep_cats
    remove_column :carers, :can_keep_dogs
  end
end
