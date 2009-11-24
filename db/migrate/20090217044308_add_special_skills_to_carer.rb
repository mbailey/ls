class AddSpecialSkillsToCarer < ActiveRecord::Migration
  def self.up
    add_column :carers, :special_skills, :string
  end

  def self.down
    remove_column :carers, :special_skills
  end
end
