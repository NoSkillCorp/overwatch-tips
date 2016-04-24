class GamingObject < ActiveRecord::Base
    has_many :tips
    
    #hash with category as keys, and a sorted tips array as value.
    def tips_hash
        Tip.empty_categories_hash.merge(tips.to_a.group_by(&:category)).map{|category, tips|
            [category, tips.sort_by{ |tip| -1*tip.score }]
        }.to_h
    end
end
