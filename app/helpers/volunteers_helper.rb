module VolunteersHelper
  
  def html_info(v)
    "<strong>#{h v.first_name} #{h v.last_name} (#{link_to 'details', v, :target=> '_details'})</strong><br/>can take dogs: #{h v.can_keep_dogs}<br/>can take cats: #{h v.can_keep_cats}<br/>take other: #{h v.can_keep_other}<br/>fence security: #{h v.how_secure}<br/>special skills: #{h v.special_skills}".gsub(/[\[{'"]*/,'') 
  end
  
  def next_action_link(volunteer)
    if volunteer.approved? or volunteer.rejected?
      link_to 'place an animal', '#'
    elsif volunteer.interview.blank?
      link_to 'conduct interview', '#'
    elsif volunteer.home_check.blank?
      link_to "book a home check", '#'
    else
      link_to "home check booked for #{volunteer.home_check.date}"
    end
  end
  
  
end
