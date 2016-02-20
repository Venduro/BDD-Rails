require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get create_car" do
    get :create_car
    assert_response :success
  end

end
