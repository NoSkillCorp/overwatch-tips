class Tip < ActiveRecord::Base
    has_one :tip_map_relation
    
    def map
       tip_map_relation.map 
    end
    
end
