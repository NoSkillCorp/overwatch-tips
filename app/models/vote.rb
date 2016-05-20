class Vote < ActiveRecord::Base
    belongs_to :tip
    
    validates :user_cookie, presence: true, uniqueness: { scope: :tip_id, message: "Can't vote twice" }
  
    scope :positives, -> { where('votes.weight > ?', 0) }
    scope :negatives, -> { where('votes.weight < ?', 0) } 
    
    def is_upvoted?
        weight > 0
    end
    
    def is_downvoted?
        weight < 0
    end
    
    def self.generate_new_user_cookie
        user_cookie = SecureRandom.hex
        user_cookie = Vote.generate_user_cookie if Vote.find_by(user_cookie: user_cookie).present?
        return user_cookie
    end
end
