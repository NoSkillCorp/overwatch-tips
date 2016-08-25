class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :multi_authenticate, :count_votes_and_tips, :set_container
  
  private
  
    #find the user, either by devise authentication or by user_cookie
    def multi_authenticate
      if user_signed_in?
        @user = current_user #from devise authentication
      else
        @user = find_user(request, cookies) #find user by user_cookie
      end
    end
  
    #Find the user by user_cookie if it exists
    def find_user(req, cookies_hash)
      user = nil
      user_ip_adress = req.remote_ip
      user_agent = req.user_agent
      user_cookie = cookies_hash["user_id"]
      #ap "cookie detected: #{user_cookie}"
      
      #Attempt to find the user by its user_cookie
      user = User.find_by(user_cookie: user_cookie, is_registered: false)
      if user_cookie.blank? || user.blank?
        #If not found by user_cookie, attempt to find the user by its IP & user_agent
        user = User.find_by(ip_adress: user_ip_adress, user_agent: user_agent, is_registered: false)
        #If user found, stores the user_cookie in the cookies of the client
        cookies.permanent["user_id"] = { value: user.user_cookie } if user.present?
      else
        #If the user is found by user_cookie, then update his IP & user_agent
        user.update(user_agent: user_agent) if user_agent != user.user_agent
        user.update(ip_adress: user_ip_adress) if user_ip_adress != user.ip_adress
      end
      return user
    end
  
    #Find or creates a user with a user_cookie
    # -> used to create a user when he tips or votes and is not connected yet
    def assign_user
      #If @user is already assigned (by multi_authenticate), stop here and don't create a user
      return @user if @user.present?

      #Otherwise, generates a user with IP & user_agent
      user_ip_adress = request.remote_ip
      user_agent = request.user_agent
      user_cookie = cookies["user_id"]
      
      @user = User.create(ip_adress: user_ip_adress, user_agent: user_agent) #generates a new user with a user_cookie
      cookies.permanent["user_id"] = { value: @user.user_cookie } #stores the user_cookie in the cookies of the client
    end
    
    def count_votes_and_tips
      @tips_count = Tip.all.count
      @votes_count = Vote.all.count
    end
    
    def set_container
      @container = (controller_name == "home" && action_name == "index") || (controller_name == "gaming_objects" && action_name == "show") ? "" : "container";
    end
    
end
