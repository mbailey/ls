class HomeCheck < ActiveRecord::Base
  validates_presence_of :booked_by
  validates_presence_of :carer
  validates_presence_of :scheduled_at
  
  belongs_to :booked_by, :class_name => "User"
  belongs_to :performed_by, :class_name => "User"
  belongs_to :carer
  
  # Return all the home checks on a given date.
  named_scope :on_date, lambda {|date|
    date = Time.zone.parse(date) if date.is_a?(String)
    { :conditions => ["scheduled_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day] }
  }
  
  def scheduled_at_date
    scheduled_at && scheduled_at.to_date
  end
  
  def scheduled_at_date=(date)
    date = Time.zone.parse(date) if date.is_a?(String)
    self.scheduled_at ||= Time.zone.now
    self.scheduled_at = Time.zone.local(date.year, date.month, date.day, scheduled_at.hour, scheduled_at.min, scheduled_at.sec)
  end
  
  def scheduled_at_time
    scheduled_at && Time.zone.local(2000, 1, 1, scheduled_at.hour, scheduled_at.min, scheduled_at.sec)
  end
  
  def scheduled_at_time=(time)
    time = Time.zone.parse(time) if time.is_a?(String)
    self.scheduled_at ||= Time.zone.now
    self.scheduled_at = Time.zone.local(scheduled_at.year, scheduled_at.month, scheduled_at.day, time.hour, time.min, time.sec)
  end
end
