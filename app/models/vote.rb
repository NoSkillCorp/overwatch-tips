class Vote < ActiveRecord::Base
    belongs_to :tip
    belongs_to :user
    
    validates :user_id, presence: true, uniqueness: { scope: :tip_id, message: "Can't vote twice" }
  
    scope :positives, -> { where('votes.weight > ?', 0) }
    scope :negatives, -> { where('votes.weight < ?', 0) } 
    
    def is_upvoted?
        weight > 0
    end
    
    def is_downvoted?
        weight < 0
    end

end
