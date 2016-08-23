class UsersController < ApplicationController
    def show
        @tips = Tip.where(user: @user).order(created_at: :desc)
    end
    
    #Transform a user_cookie into a devise user
    def register
        if @user.is_registered
            redirect_to :root, alert: "Account already registered"
        else
            
        end
    end
    
end