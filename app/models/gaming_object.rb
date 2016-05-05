include GamingObjectsHelper

class GamingObject < ActiveRecord::Base
    has_many :tips
    
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
            [category, tips.sort_by{ |tip| -1*tip.score }]
        }.to_h
    end
    
    #Hahs of empty arrays for each category
    def empty_categories_hash
        self.class::CATEGORIES.map{ |category| [category, []] }.to_h
    end
end
