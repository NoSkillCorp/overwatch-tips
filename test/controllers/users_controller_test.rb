require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers
    
    test "should show profile" do
        get :show
        assert_response :success
    end

end