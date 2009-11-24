require 'test_helper'

class CarersControllerTest < ActionController::TestCase

  should "get new" do
    get :new
    assert_response :success
  end

  should "create carer" do
    assert_difference('Carer.count') do
      post :create, :carer => Carer.plan
    end

    assert_response :success
  end

end
