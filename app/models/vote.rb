class Vote < ActiveRecord::Base
    belongs_to :tip
    
    validates :user_cookie, presence: true, uniqueness: { scope: :tip_id, message: "Can't vote twice" }
  
    scope :positives, -> { where('votes.weight > ?', 0) }
    scope :negatives, -> { where('votes.weight < ?', 0) } 
end
