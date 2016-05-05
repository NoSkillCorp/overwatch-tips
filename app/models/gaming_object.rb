class GamingObject < ActiveRecord::Base
    has_many :tips
    
    #Fill this with the categories in your class inheriting from GamingObject
    CATEGORIES = []
    
    #hash with category as keys, and a sorted tips array as value.
    def tips_hash
        empty_categories_hash.merge(tips.to_a.group_by(&:category)).map{|category, tips|
            [category, tips.sort_by{ |tip| -1*tip.score }]
        }.to_h
    end
    
    def empty_categories_hash
        self.class::CATEGORIES.map{ |category| [category, []] }.to_h
    end
end
