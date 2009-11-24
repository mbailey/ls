require 'test_helper'

class CarerTest < ActiveSupport::TestCase
  
  should "create a carer" do
    # This is really just to make sure our blueprint isn't broken.
    assert_not_nil Carer.make
  end
  
end
