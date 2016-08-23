class RegistredUserValidator < ActiveModel::Validator
  def validate(record)
    if record.is_registered
        record.errors[:email] << "is missing" if record.email.blank?
        record.errors[:email] << "is already used" if User.find_by(email: record.email).present?
        record.errors[:email] << "is invalid" unless record.email =~ Devise.email_regexp
        record.errors[:password] << "should be between #{Devise.password_length.begin} and #{Devise.password_length.end} characters" if record.password.length.in?(Devise.password_length)
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
