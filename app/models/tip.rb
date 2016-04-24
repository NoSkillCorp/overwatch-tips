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
        votes.positives.sum(:weight)
    end
    
    def negative_score
        votes.negatives.sum(:weight).abs
    end
    
    def upvote(user_cookie)
        votes.build(weight: 1, user_cookie: user_cookie).save
    end
    
    def downvote(user_cookie)
        votes.build(weight: -1, user_cookie: user_cookie).save
    end
end
