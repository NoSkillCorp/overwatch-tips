class UsersController < ApplicationController
    def show
        @tips = Tip.where(user: @user).order(created_at: :desc)
    end
    
    #Transform a user_cookie into a devise user
    def register
        if @user.blank? || (!@user.is_registered && @user.tips.count == 0 && @user.votes.count == 0)
            redirect_to :profile, alert: "Registration Impossible. There is nothing to register"
        elsif @user.is_registered
            #TODO : suprimmer cette possibilité en effaçant le user_cookie lors d'un register
            redirect_to :profile, alert: "Registration Impossible. Account already registered"
        else
            ap user_registration_params.to_h
            if @user.register(args=user_registration_params.to_h)
                sign_in @user
                redirect_to :profile, notice: "Account successfully registered. You can now login from anywhere !"
            else
                redirect_to :profile
            end
        end
    end
    
    def user_registration_params
       params.permit(:email, :password, :password_confirmation)
    end
    
end