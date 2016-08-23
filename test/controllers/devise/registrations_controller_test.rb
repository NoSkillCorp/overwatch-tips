require 'test_helper'

class Devise::RegistrationsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers
    
    def setup
        @request.env["devise.mapping"] = Devise.mappings[:user]
    end
    
    test "sign_up should create user" do
        assert_difference 'User.count', 1 do
            post :create, params: { "user" => { "email" => "tata@yoyo.chapeau", "password" => "123456789", "password_confirmation" => "123456789" } }
        end
    end
    
    #quick check of a user validation, just to be sure
    test "sign_up without email should not create user" do
        assert_no_difference 'User.count' do
            post :create, params: { "user" => { "email" => "", "password" => "123456789", "password_confirmation" => "123456789" } }
        end
    end

end