class HomeCheck < ActiveRecord::Base
  validates_presence_of :booked_by
  validates_presence_of :carer
  
  belongs_to :booked_by, :class_name => "User"
  belongs_to :performed_by, :class_name => "User"
  belongs_to :carer
end
