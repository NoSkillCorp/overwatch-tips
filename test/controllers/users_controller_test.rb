require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers
    
    test "should show profile" do
        get :show
        assert_response :success
    end
    
    test "register should update user and delete its cookies" do
        user = User.create()
        assert_not_nil user.user_cookie
        
        #create a tip for the user to be able to register
        Tip.create(user: user, description: "tip test", gaming_object: GamingObject.first, category: "as")
        
        cookies["user_id"] = user.user_cookie
        post :register, params: {"email" => "dev@test.cnil", password: "123654", password_confirmation: "123654"}
        
        saved_user = User.find_by(email: "dev@test.cnil")
        assert_not_nil saved_user
        assert_equal saved_user.id, user.id
        assert_nil saved_user.user_cookie
        assert_not_nil saved_user.encrypted_password
    end
    
    #Tests one validation of the user just to be sure
    test "register should not update user when email/password invalid" do
        user = User.create()
        #create a tip for the user to be able to register
        Tip.create(user: user, description: "tip test", gaming_object: GamingObject.first, category: "as")
        
        cookies["user_id"] = user.user_cookie
        post :register, params: {"email" => "dev@test.cnil", password: "123", password_confirmation: "123"} 
        saved_user = User.find_by(email: "dev@test.cnil")
        assert_nil saved_user
    end

end