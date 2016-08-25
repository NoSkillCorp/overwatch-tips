class UsersController < ApplicationController
    def show
        @tips = Tip.where(user: @user).order(created_at: :desc)
    end
    
    #Transform a user_cookie into a devise user
    def register
        if @user.blank? || (!@user.is_registered && @user.tips.count == 0 && @user.votes.count == 0)
            redirect_to :profile, alert: "Registration Impossible. There is nothing to register"
        elsif @user.is_registered
            redirect_to :profile, alert: "Registration Impossible. Account already registered"
        else
            if @user.register(user_registration_params.to_h)
                #cookies.delete("user_id") #don't delete the cookie, just in case I'm logging in on someone else's device.
                sign_in @user
                redirect_to :profile, notice: "Account successfully registered. You can now login from anywhere !"
            else
                redirect_to :profile, alert: "Registration failed. #{@user.errors.full_messages.to_sentence}"
            end
        end
    end
    
    def user_registration_params
       params.permit(:email, :password, :password_confirmation)
    end
    
end