class Tip < ActiveRecord::Base
    CATEGORIES = ["as", "with", "against"]
    
    belongs_to :gaming_object
    has_many :votes, dependent: :destroy

    validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }
    validates :description, presence: true
    
    def self.empty_categories_hash
       CATEGORIES.map{ |category| [category, []] }.to_h
    end
    
    def score
       votes.sum(:weight)
    end
    
    def positive_score
        votes.positives.count
    end
    
    def negative_score
        votes.negatives.count
    end
    
    def is_upvoted?(user_cookie)
        votes.positives.where(user_cookie: user_cookie).count > 0
    end
    
    def is_downvoted?(user_cookie)
        votes.negatives.where(user_cookie: user_cookie).count > 0
    end
    
    #either creates a vote, or change the weight of an existing one
    def upvote(user_cookie)
        existing_vote = votes.find_by(user_cookie: user_cookie)
        if existing_vote.blank?
            votes.build(weight: 1, user_cookie: user_cookie).save
        else
            existing_vote.update(weight: 1) if existing_vote.weight < 0
        end
    end
    
    #either creates a vote, or change the weight of an existing one
    def downvote(user_cookie)
        existing_vote = votes.find_by(user_cookie: user_cookie)
        if existing_vote.blank?
            votes.build(weight: -1, user_cookie: user_cookie).save
        else
            existing_vote.update(weight: -1) if existing_vote.weight > 0
        end
    end
end
