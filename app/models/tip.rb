class Tip < ActiveRecord::Base
    CATEGORIES = ["as", "with", "against"]
    
    belongs_to :gaming_object
    has_many :votes, dependent: :destroy
    belongs_to :user, foreign_key: :user_cookie, primary_key: :user_cookie

    validates :category, inclusion: { in: Character::CATEGORIES + Map::CATEGORIES, message: "%{value} is not a valid category" }
    validates :description, presence: true, length: { maximum: 1000 }
    
    scope :ordered_by_score, -> { joins(:votes).select("SUM(votes.weight) as score, tips.*").group('tips.id').order("score DESC") }
    
    if(Rails.env.production?)
        scope :ordered_by_vote_count, -> { joins(:votes).where("votes.weight > 0").where("votes.created_at" => (DateTime.now - 7.days)..DateTime.now).select("COUNT(votes.id) - DATE_PART('days', NOW()::timestamp - tips.created_at::timestamp) as vote_count, tips.*").group('tips.id').order("vote_count DESC") }
    else
        scope :ordered_by_vote_count, -> { joins(:votes).where("votes.weight > 0").where("votes.created_at" => (DateTime.now - 7.days)..DateTime.now).select("COUNT(votes.id) - (julianday('now') - julianday(tips.created_at)) as vote_count, tips.*").group('tips.id').order("vote_count DESC") }
    end
    
    scope :joins_last_vote, -> { joins(:votes).joins("LEFT OUTER JOIN votes other_votes ON votes.tip_id = other_votes.tip_id AND (votes.created_at < other_votes.created_at OR (votes.created_at = other_votes.created_at AND votes.id < other_votes.id))").where("other_votes.id IS NULL") }
    
    def score
       votes.sum(:weight)
    end
    
    def positive_score
        votes.positives.count
    end
    
    def negative_score
        votes.negatives.count
    end
    
    def is_shameful
        score < -3
    end
    
    def is_voted?(user)
        return false if user.blank?
        votes.where(user_cookie: user.user_cookie).count > 0
    end
    
    def is_upvoted?(user)
        return false if user.blank?
        votes.positives.where(user_cookie: user.user_cookie).count > 0
    end
    
    def is_downvoted?(user)
        return false if user.blank?
        votes.negatives.where(user_cookie: user.user_cookie).count > 0
    end
    
    #either creates a vote, or change the weight of an existing one
    #if the tip is already upvoted, delete the vote
    def upvote(user)
        return nil if user.blank? || user.user_cookie.blank?
        existing_vote = votes.find_by(user_cookie: user.user_cookie)
        if existing_vote.blank?
            votes.build(weight: 1, user_cookie: user.user_cookie).save
        else
            existing_vote.delete if existing_vote.is_upvoted?
            existing_vote.update(weight: 1) if existing_vote.weight < 0
        end
    end
    
    #either creates a vote, or change the weight of an existing one
    #if the tip is already downvoted, delete the vote
    def downvote(user)
        return nil if user.blank? || user.user_cookie.blank?
        existing_vote = votes.find_by(user_cookie: user.user_cookie)
        if existing_vote.blank?
            votes.build(weight: -1, user_cookie: user.user_cookie).save
        else
            existing_vote.delete if existing_vote.is_downvoted?
            existing_vote.update(weight: -1) if existing_vote.weight > 0
        end
    end
    
    def playing_sentence
        if gaming_object.is_a?(Character)
            "Playing #{category} #{gaming_object.name}"
        elsif gaming_object.is_a?(Map)
            "Playing #{category} in #{gaming_object.name}"
        end
    end
    
    def gaming_object_type
       gaming_object.type
    end
    
    def self.greatest_tips(number_of_tips, page_num=1)
        self.ordered_by_score.page(page_num).per(number_of_tips)
    end
    
    def self.latest_tips(number_of_tips, page_num=1)
        self.order(created_at: :desc).page(page_num).per(number_of_tips)
    end
    
    def self.trending_tips(number_of_tips, page_num=1)
        self.ordered_by_vote_count.page(page_num).per(number_of_tips)
    end
    
    def self.random(**args)
       current_tip_id = args[:current_tip].try(:id) || args[:current_tip_id]
       random_tip_id = (current_tip_id ? Tip.where.not(id: current_tip_id) : Tip).pluck(:id).sample
       random_tip = Tip.find(random_tip_id)
       return random_tip.score >= 0 ? random_tip : self.random
    end

end
