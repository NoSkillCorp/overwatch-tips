class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :find_user, :count_votes_and_tips
  
  private
  
    #Find the user if it exists
    def find_user
      user_ip_adress = request.remote_ip
      user_agent = request.user_agent
      user_cookie = cookies["user_id"]
      @user = User.find_by(user_cookie: user_cookie)
      if user_cookie.blank? || @user.blank?
        @user = User.find_by(ip_adress: user_ip_adress, user_agent: user_agent)
      else
        @user.update(user_agent: user_agent) if user_agent != @user.user_agent
        @user.update(ip_adress: user_ip_adress) if user_ip_adress != @user.ip_adress
      end
    end
  
    #Find or Assign a user, when he tips or votes
    def assign_user
      user_ip_adress = request.remote_ip
      user_agent = request.user_agent
      user_cookie = cookies["user_id"]
      @user = User.find_by(user_cookie: user_cookie)
      if user_cookie.blank? || @user.blank?
        @user = User.find_by(ip_adress: user_ip_adress, user_agent: user_agent)
        if @user.blank?
          @user = User.create(ip_adress: user_ip_adress, user_agent: user_agent) #generates a new user_cookie
        end
        cookies.permanent["user_id"] = { value: @user.user_cookie } #stores the user_cookie in the cookies of the client
      else
        @user.update(user_agent: user_agent) if user_agent != @user.user_agent
        @user.update(ip_adress: user_ip_adress) if user_ip_adress != @user.ip_adress
      end
    end
    
    def count_votes_and_tips
      @tips_count = Tip.all.count
      @votes_count = Vote.all.count
    end
    
end
