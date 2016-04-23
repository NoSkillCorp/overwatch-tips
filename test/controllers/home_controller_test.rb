require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "GET index" do
    get :index
    assert_response :success
  end
end
