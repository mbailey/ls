class Placement < ActiveRecord::Base
  
  STATUSES = ['seeking carer', 'waiting for collection', 'with carer', 'closed']
  
  has_and_belongs_to_many :capabilities, :uniq => true
  has_many :invitations
  belongs_to :carer
  belongs_to :animal
  
  named_scope :current, :conditions => "status != 'closed'", :order => 'created_at desc'
  named_scope :limit, lambda { |num| { :limit => num } }
  
  # cannot have two open placements for the same animal
  validates_uniqueness_of :status, 
    :scope => :animal_id,  
    :if => "status != 'closed'",
    :message => "Animal already has an open placement" 
  
  def cannot_have_two_open_placements_for_same_animal
    if ! Placement.find(:all, :conditions => ["animal_id = ? and status != 'closed'", animal_id]).blank?
      errors.add(:animal_id, "there is already a placement open for this animal")  
    end
  end
  
  def requests_sent
    invitations.size
  end
  
  def accepted_requests
    invitations.accepted
  end
  
  def outstanding_requests
    invitations.outstanding
  end
  
  
end
