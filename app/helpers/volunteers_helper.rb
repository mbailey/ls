module VolunteersHelper
  
  def html_info(v)
    "<strong>#{h v.first_name} #{h v.last_name} (#{link_to 'details', v, :target=> '_details'})</strong><br/>can take dogs: #{h v.can_keep_dogs}<br/>can take cats: #{h v.can_keep_cats}<br/>take other: #{h v.can_keep_other}<br/>fence security: #{h v.how_secure}<br/>special skills: #{h v.special_skills}".gsub(/[\[{'"]*/,'') 
  end
  
  def next_action_link(volunteer)
    if volunteer.approved? 
      link_to 'place an animal', '#'
    elsif volunteer.rejected?
      "volunteer application rejected!"
    elsif not volunteer.interview_completed?
      link_to 'conduct interview', edit_admin_volunteer_interview_path(volunteer)
    elsif volunteer.home_check.blank?
      link_to "book a home check", [:new, :admin, volunteer, :home_check]
    else
      link_to "home check booked for #{volunteer.home_check.scheduled_at}", [:edit, :admin, volunteer.home_check]
    end
  end
  
  
end
