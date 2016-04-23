class Vote < ActiveRecord::Base
    belongs_to :tip
  
    scope :positives, -> { where('votes.weight > ?', 0) }
    scope :negatives, -> { where('votes.weight < ?', 0) } 
end
