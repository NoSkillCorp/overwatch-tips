class RegistredUserValidator < ActiveModel::Validator
  def validate(record)
    #if user is registred (aka if you identify by devise instead of a just a cookie)
    if record.is_registered
        #Check email
        if record.email.blank?
            record.errors.add(:email, "is missing")
        elsif record.email !~ Devise.email_regexp
            record.errors.add(:email, :invalid)
        elsif User.find_by(is_registered: true, email: record.email).present?
            record.errors.add(:email, "is already used")
        end
        #Check password
        if record.password.blank?
            record.errors.add(:password, "is missing")
        elsif !record.password.length.in?(Devise.password_length)
            record.errors.add(:password, :invalid, message: "should be between #{Devise.password_length.begin} and #{Devise.password_length.end} characters")
        end
    end
  end
end

class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :rememberable, :trackable #, :validatable
         
    has_many :votes, foreign_key: :user_cookie, primary_key: :user_cookie
    has_many :tips, foreign_key: :user_cookie, primary_key: :user_cookie
    
    before_save :assign_user_cookie
    validates :user_cookie, uniqueness: true
    validates_with RegistredUserValidator
    
    def assign_user_cookie
       self.user_cookie = User.generate_new_user_cookie if self.user_cookie.blank?
    end
    
    def self.generate_new_user_cookie
        user_cookie = SecureRandom.hex
        user_cookie = User.generate_new_user_cookie if User.find_by(user_cookie: user_cookie).present?
        return user_cookie
    end

end
