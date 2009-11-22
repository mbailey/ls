require 'test_helper'

class HomeChecksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_check" do
    assert_difference('HomeCheck.count') do
      post :create, :home_check => { }
    end

    assert_redirected_to home_check_path(assigns(:home_check))
  end

  test "should show home_check" do
    get :show, :id => home_checks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => home_checks(:one).to_param
    assert_response :success
  end

  test "should update home_check" do
    put :update, :id => home_checks(:one).to_param, :home_check => { }
    assert_redirected_to home_check_path(assigns(:home_check))
  end

  test "should destroy home_check" do
    assert_difference('HomeCheck.count', -1) do
      delete :destroy, :id => home_checks(:one).to_param
    end

    assert_redirected_to home_checks_path
  end
end
