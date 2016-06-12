class MetaCharacter < ActiveRecord::Base
    belongs_to :strong_character, foreign_key: :strong_character_id, class_name:"GamingObject" 
    belongs_to :weak_character, foreign_key: :weak_character_id, class_name:"GamingObject" 
end
