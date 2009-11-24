module CarersHelper
  
  def html_info(v)
    "<strong>#{h v.first_name} #{h v.last_name} (#{link_to 'details', v, :target=> '_details'})</strong><br/>can take dogs: #{h v.can_keep_dogs}<br/>can take cats: #{h v.can_keep_cats}<br/>take other: #{h v.can_keep_other}<br/>fence security: #{h v.how_secure}<br/>special skills: #{h v.special_skills}".gsub(/[\[{'"]*/,'') 
  end
  
  def next_action_link(carer)
    if carer.approved? 
      link_to 'place an animal', '#'
    elsif carer.rejected?
      "carer application rejected!"
    elsif not carer.interview_completed?
      link_to 'conduct interview', edit_admin_carer_interview_path(carer)
    elsif carer.home_check.blank?
      link_to "book a home check", [:new, :admin, carer, :home_check]
    elsif ! carer.home_check.completed
      link_to "home check booked for #{carer.home_check.scheduled_at.to_s(:date_and_time)}", [:edit, :admin, carer.home_check]
    else
      link_to 'approve or reject application', edit_admin_carer_path(carer)
    end
  end
  
  
end
