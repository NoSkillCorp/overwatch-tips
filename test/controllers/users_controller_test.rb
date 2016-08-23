require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers
    
    test "should show profile" do
        get :show
        assert_response :success
    end
    
    test "register should update user" do
       #post :register, params: {"email" => "dev@test.cnil", password: "123654", password_confirmation: "123654"} 
       #assert_response :success
    end

end