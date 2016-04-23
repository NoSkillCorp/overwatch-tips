class Map < ActiveRecord::Base
    include OverwatchObject
    
    has_many :tip_map_relations
    has_many :tips, through: :tip_map_relations
end
