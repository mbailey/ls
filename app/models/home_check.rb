class HomeCheck < ActiveRecord::Base
  validates_presence_of :booked_by
  validates_presence_of :volunteer
  
  belongs_to :booked_by, :class_name => "User"
  belongs_to :performed_by, :class_name => "User"
  belongs_to :volunteer
end
