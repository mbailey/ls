class HomeCheck < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :volunteer
  
  belongs_to :user
  belongs_to :volunteer
end
