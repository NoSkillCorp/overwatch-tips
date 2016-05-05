module TipsHelper
    
    def playing_sentence(category, gaming_object)
        if gaming_object.is_a?(Character)
            "Playing #{category} #{gaming_object.name}"
        elsif gaming_object.is_a?(Map)
            "Playing #{category} in #{gaming_object.name}"
        end
    end
end
