class PlacementRequest < ActiveRecord::Base
  
  RESPONSE_TYPES = %w(declined accepted)
  
  belongs_to :carer
  belongs_to :placement
  
  named_scope :outstanding, :conditions => "response_type IS NULL"
  named_scope :accepted, :conditions => {:response_type => 'accept'}
  named_scope :declined, :conditions => {:response_type => 'decline'}
  
  def status
    response_type || 'not yet responded'
  end
  
end
