class HomeCheck < ActiveRecord::Base
  validates_presence_of :booked_by
  validates_presence_of :signup
  validates_presence_of :scheduled_at
  
  belongs_to :booked_by, :class_name => "User"
  belongs_to :performed_by, :class_name => "User"
  belongs_to :signup
  
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
  
  def self.possible_times
    ["8:00 am", "8:30 am", "9:00 am", "9:30 am", "10:00 am", "10:30 am", "11:00 am", "11:30 am", "12:00 pm", "12:30 pm",
     "1:00 pm", "1:30 pm", "2:00 pm", "2:30 pm", "3:00 pm", "3:30 pm", "4:00 pm", "4:30 pm", "5:00 pm", "5:30 pm",
     "6:00 pm", "6:30 pm", "7:00 pm", "7:30 pm", "8:00 pm"]
  end
end
