class Tip < ActiveRecord::Base
    CATEGORIES = ["as", "with", "against"]
    
    belongs_to :gaming_object
    
    validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }
    validates :title, :description, presence: true
end
