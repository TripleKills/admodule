require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get regist" do
    get :regist
    assert_response :success
  end

end
