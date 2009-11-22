class User < ActiveRecord::Base
  acts_as_authentic
  
  def name
    "#{first_name} #{last_name}"
  end
end
