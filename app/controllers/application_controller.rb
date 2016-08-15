class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :find_user, :count_votes_and_tips, :set_container
  
  private
  
    #Find the user if it exists
    def find_user
      user_ip_adress = request.remote_ip
      user_agent = request.user_agent
      user_cookie = cookies["user_id"]
      #Attempt to find the user by its user_cookie
      @user = User.find_by(user_cookie: user_cookie)
      if user_cookie.blank? || @user.blank?
        #If not found by user_cookie, attempt to find the user by its IP & user_agent
        @user = User.find_by(ip_adress: user_ip_adress, user_agent: user_agent)
        #And if no user is found with ip & user_agent, then no user is set.
      else
        #If the user is found by user_cookie, then update his IP & user_agent
        @user.update(user_agent: user_agent) if user_agent != @user.user_agent
        @user.update(ip_adress: user_ip_adress) if user_ip_adress != @user.ip_adress
      end
    end
  
    #Find or Assign a user, when he tips or votes
    def assign_user
      return @user if @user.present?
      
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
    
    def set_container
      @container = (controller_name == "home" && action_name == "index") || (controller_name == "gaming_objects" && action_name == "show") ? "" : "container";
    end
    
end
