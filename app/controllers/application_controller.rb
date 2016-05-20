class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :generate_user_cookie, :count_votes_and_tips
  
  private
  
    def generate_user_cookie
      cookies.permanent["user_id"] = { value: Vote.generate_user_cookie } unless cookies.has_key?("user_id")
      @user_cookie = cookies["user_id"]
    end
    
    def count_votes_and_tips
      @tips_count = Tip.all.count
      @votes_count = Vote.all.count
    end
    
    
    
end
