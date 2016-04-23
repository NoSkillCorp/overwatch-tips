class Tip < ActiveRecord::Base
    has_many :tip_map_relations
    has_many :maps, through: :tip_map_relations
end
