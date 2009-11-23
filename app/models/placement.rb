class Placement < ActiveRecord::Base
  
  has_many :placement_requests
  has_one :volunteer
  
  validate_on_create :cannot_have_two_open_placements_for_same_animal 
  
  def cannot_have_two_open_placements_for_same_animal
    if ! Placement.find(:all, :conditions => ["animal_id = ? and status != 'closed'", animal_id]).blank?
      errors.add(:animal_id, "there is already a placement open for this animal")  
    end
  end
  
  STATUSES = ['seeking carer', 'with carer', 'closed']
  
  belongs_to :volunteer
  belongs_to :animal
  
  named_scope :current, :conditions => "status != 'closed'", :order => 'created_at desc'
  
  def requests_sent
    placement_requests.size
  end
  
  def accepted_requests
    placement_requests.accepted
  end
  
  def outstanding_requests
    placement_requests.outstanding
  end
  
  
end
