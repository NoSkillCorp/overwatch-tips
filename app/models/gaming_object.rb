include GamingObjectsHelper
include ActionView::Helpers::AssetUrlHelper


class GamingObject < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :tips
    has_many :weaker_meta_characters, foreign_key: "strong_character_id", class_name: "MetaCharacter"
    has_many :stronger_meta_characters, foreign_key: "weak_character_id", class_name: "MetaCharacter"
    has_many :weaker_characters, through: :weaker_meta_characters, :source => :weak_character
    has_many :stronger_characters, through: :stronger_meta_characters, :source => :strong_character
    
    
    #Fill this with the categories in your class inheriting from GamingObject
    CATEGORIES = []
    
    #hash with category as keys, and a sorted tips array as value.
    #if duration is nil, retreive all tips. Otherwise, retreive tips created during the last [duration]
    def tips_hash(duration)
        if duration.present?
            today = Date.today
            range = (today - duration)..(today + 1.day)
            tips_list = tips.where(created_at: range)
        else
            tips_list = tips
        end
        # creates a hash with empty arrays for categories with no tips
        empty_categories_hash.merge(tips_list.to_a.group_by(&:category)).map{|category, tips|
            good_tips, bad_tips = [], []
            tips.each{|tip| tip.is_shameful ? bad_tips << tip : good_tips << tip}
            good_tips.sort_by!{|tip| -1*tip.score}
            bad_tips.sort_by!{|tip| -1*tip.score}
            [category, {good_tips: good_tips, bad_tips: bad_tips}]
        }.to_h
    end
    
    #Hahs of empty arrays for each category
    def empty_categories_hash
        self.class::CATEGORIES.map{ |category| [category, []] }.to_h
    end
    
    #Get the tip with the highest score for this gaming_object
    def highest_score_tip
       Tip.where(gaming_object_id: self.id).ordered_by_score.first
    end
    
    #rename & serialize of highest_score_tip() for API purposes
    def best_tip
        tip = self.highest_score_tip
        if tip
            TipSerializer.new(tip).to_hash
        else
            nil
        end
    end
    
    def image_src
        ActionController::Base.helpers.asset_path(image_path)
    end
end
