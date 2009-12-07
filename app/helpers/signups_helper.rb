module SignupsHelper
  def next_action_link(signup)
    if signup.approved? 
      link_to 'approved', [:admin, signup.carer]
    elsif signup.rejected?
      link_to "carer application rejected", [:admin, signup]
    elsif not signup.interview_completed?
      link_to 'conduct interview', edit_admin_signup_interview_path(signup)
    elsif signup.home_check.blank?
      link_to "book a home check", [:new, :admin, signup, :home_check]
    elsif ! signup.home_check.completed
      link_to "home check booked for #{signup.home_check.scheduled_at.to_s(:date_and_time)}", [:edit, :admin, signup.home_check]
    else
      link_to 'approve or reject application', edit_admin_signup_decision_path(signup)
    end
  end
end