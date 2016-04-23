class GamingObject < ActiveRecord::Base
    has_many :tips
    
    def tips_hash
        Tip.empty_categories_hash.merge(tips.to_a.group_by(&:category))
    end
end
