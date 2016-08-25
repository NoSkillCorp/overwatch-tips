class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :rememberable, :trackable #, :validatable
         
    has_many :votes
    has_many :tips
    
    validates :user_cookie, uniqueness: true, allow_blank: true
    validates_with RegisteredUserValidator #validates email & password if user is registered or if email is present
    
    before_save :assign_user_cookie, :set_is_registered
    
    def register(args={})
        self.email = args[:email]
        self.password = args[:password]
        self.password_confirmation = args[:password_confirmation]
        self.is_registered = true
        self.user_cookie = nil # won't need the user_cookie after being registered
        self.save
    end
    
    #if we are about to save it for the first time and the email is not nil
    def set_is_registered
        if !self.persisted? && !self.email.nil?
            self.is_registered = true
        end
    end
    
    #assigns an unused user_cookie
    def assign_user_cookie
       self.user_cookie = User.generate_new_user_cookie if self.user_cookie.blank? && !self.persisted?
    end
    
    #generates an unused user_cookie
    def self.generate_new_user_cookie
        user_cookie = SecureRandom.hex
        user_cookie = User.generate_new_user_cookie if User.find_by(user_cookie: user_cookie, is_registered: false).present?
        return user_cookie
    end

end
