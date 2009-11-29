module PlacementsHelper
  
  def request_status(p)
    if ! p.accepted_requests.blank?
      "#{p.accepted_requests.size} accepted"
    elsif ! p.outstanding_requests.blank?
      "#{p.outstanding_requests.size} outstanding"
    else
      link_to_unless_current 'send more requests', [:admin, p.animal]
    end
    
  end
  
end
