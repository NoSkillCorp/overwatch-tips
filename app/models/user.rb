class User < ActiveRecord::Base
    has_many :votes, foreign_key: :user_cookie, primary_key: :user_cookie
    has_many :tips, foreign_key: :user_cookie, primary_key: :user_cookie
    
    
    before_save :assign_user_cookie
    validates :user_cookie, uniqueness: true
    
    def assign_user_cookie
       self.user_cookie = User.generate_new_user_cookie if self.user_cookie.blank?
    end
    
    def self.generate_new_user_cookie
        user_cookie = SecureRandom.hex
        user_cookie = User.generate_new_user_cookie if User.find_by(user_cookie: user_cookie).present?
        return user_cookie
    end
end
