require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  test "GET index" do
    get :index
    assert_response :success
  end
end
