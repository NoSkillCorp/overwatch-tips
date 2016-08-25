class RegisteredUserValidator < ActiveModel::Validator
  def validate(record)
    #if user is registred (aka if you identify by devise instead of a just a cookie)
    if record.is_registered || !record.email.nil?
        #Check email
        if record.email.blank?
            record.errors.add(:email, "is missing")
        elsif record.email !~ Devise.email_regexp
            record.errors.add(:email, :invalid)
        elsif User.where.not(id: record.id).find_by(is_registered: true, email: record.email).present?
            record.errors.add(:email, "is already used")
        end
        #Check password
        if record.password.blank?
            record.errors.add(:password, "is missing")
        elsif !record.password.length.in?(Devise.password_length)
            record.errors.add(:password, :invalid, message: "should be between #{Devise.password_length.begin} and #{Devise.password_length.end} characters")
        elsif record.password != record.password_confirmation
            record.errors.add(:password_confirmation, :invalid)
        end
    end
  end
end
