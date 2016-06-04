class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :assign_user, :count_votes_and_tips
  
  private
  
    def assign_user
      user_cookie = cookies["user_id"]
      if user_cookie.blank?
        @user = User.create #generates a new user_cookie
        cookies.permanent["user_id"] = { value: @user.user_cookie } #stores the user_cookie in the cookies of the client
      else
        @user = User.find_by(user_cookie: user_cookie)
      end
    end
    
    def count_votes_and_tips
      @tips_count = Tip.all.count
      @votes_count = Vote.all.count
    end
    
    
    
end
