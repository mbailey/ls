class AddInterviewToCarers < ActiveRecord::Migration
  def self.up
    add_column :carers, :interview_completed, :boolean
    add_column :carers, :interview_notes, :text
    add_column :carers, :interview_date, :datetime
    add_column :carers, :interview_user_id, :integer
  end

  def self.down
    remove_column :carers, :interview_user_id
    remove_column :carers, :interview_date
    remove_column :carers, :interview_notes
    remove_column :carers, :interview_completed
  end
end
