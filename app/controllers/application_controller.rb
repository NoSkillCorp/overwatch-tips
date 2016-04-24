class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :generate_user_cookie
  
  private
  
    def generate_user_cookie
      cookies["user_id"] = SecureRandom.hex unless cookies.has_key?("user_id")
      @user_cookie = cookies["user_id"]
    end
    
    
end
