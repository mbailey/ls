class AddInterviewToVolunteers < ActiveRecord::Migration
  def self.up
    add_column :volunteers, :interview_completed, :boolean
    add_column :volunteers, :interview_notes, :text
    add_column :volunteers, :interview_date, :datetime
    add_column :volunteers, :interview_user_id, :integer
  end

  def self.down
    remove_column :volunteers, :interview_user_id
    remove_column :volunteers, :interview_date
    remove_column :volunteers, :interview_notes
    remove_column :volunteers, :interview_completed
  end
end
