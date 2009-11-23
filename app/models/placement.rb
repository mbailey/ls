class Placement < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :animal
end
