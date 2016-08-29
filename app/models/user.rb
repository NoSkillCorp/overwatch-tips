class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :rememberable, :trackable #, :validatable
         
    has_many :votes
    has_many :tips
    
    validates :user_cookie, uniqueness: true, allow_blank: true
    validates_with RegisteredUserValidator #validates email & password if user is registered or if email is present
    
    before_save :assign_user_cookie_or_register
    
    def register(args={})
        self.email = args[:email]
        self.password = args[:password]
        self.password_confirmation = args[:password_confirmation]
        self.is_registered = true
        self.user_cookie = nil # won't need the user_cookie after being registered
        self.save
    end

    #If we're about to create a user,
    # set is_registered at true if email is not nil
    # assign a user_cookie if not registering
    def assign_user_cookie_or_register
        if !self.persisted?
            self.is_registered = true if !self.email.nil?
            if !self.is_registered
                self.user_cookie = User.generate_new_user_cookie if self.user_cookie.blank?
            end
        end
    end
    
    #generates an unused user_cookie
    def self.generate_new_user_cookie
        user_cookie = SecureRandom.hex
        user_cookie = User.generate_new_user_cookie if User.find_by(user_cookie: user_cookie, is_registered: false).present?
        return user_cookie
    end

end
