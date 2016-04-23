class Tip < ActiveRecord::Base
    belongs_to :gaming_object
    #enum category: ["as", "with", "against"]
end
