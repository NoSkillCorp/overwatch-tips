class Tip < ActiveRecord::Base
    CATEGORIES = ["as", "with", "against"]
    
    belongs_to :gaming_object
    has_many :votes, dependent: :destroy

    validates :category, inclusion: { in: Character::CATEGORIES + Map::CATEGORIES, message: "%{value} is not a valid category" }
    validates :description, presence: true, length: { maximum: 1000 }
    
    def score
       votes.sum(:weight)
    end
    
    def positive_score
        votes.positives.count
    end
    
    def negative_score
        votes.negatives.count
    end
    
    def is_voted?(user_cookie)
        votes.where(user_cookie: user_cookie).count > 0
    end
    
    def is_upvoted?(user_cookie)
        votes.positives.where(user_cookie: user_cookie).count > 0
    end
    
    def is_downvoted?(user_cookie)
        votes.negatives.where(user_cookie: user_cookie).count > 0
    end
    
    #either creates a vote, or change the weight of an existing one
    #if the tip is already upvoted, delete the vote
    def upvote(user_cookie)
        existing_vote = votes.find_by(user_cookie: user_cookie)
        if existing_vote.blank?
            votes.build(weight: 1, user_cookie: user_cookie).save
        else
            existing_vote.delete if existing_vote.is_upvoted?
            existing_vote.update(weight: 1) if existing_vote.weight < 0
        end
    end
    
    #either creates a vote, or change the weight of an existing one
    #if the tip is already downvoted, delete the vote
    def downvote(user_cookie)
        existing_vote = votes.find_by(user_cookie: user_cookie)
        if existing_vote.blank?
            votes.build(weight: -1, user_cookie: user_cookie).save
        else
            existing_vote.delete if existing_vote.is_downvoted?
            existing_vote.update(weight: -1) if existing_vote.weight > 0
        end
    end
end
