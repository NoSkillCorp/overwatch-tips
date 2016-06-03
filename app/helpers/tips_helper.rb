module TipsHelper
    
    def playing_sentence(category, gaming_object)
        if gaming_object.is_a?(Character)
            "Playing #{category} #{gaming_object.name}"
        elsif gaming_object.is_a?(Map)
            "Playing #{category} in #{gaming_object.name}"
        end
    end
    
    def description_with_links(description)
        gaming_objects = GamingObject.all.to_a
        words = description.split(" ")
        words.map{ |word|
            go = gaming_objects.find{|g| g.name.downcase == word.downcase}
            if go.present?
                path = send("#{go.class.to_s.underscore}_path", go)
                link_to(word, path, class: "in-text-link")
            else
                word
            end
        }.join(" ")
    end
end
