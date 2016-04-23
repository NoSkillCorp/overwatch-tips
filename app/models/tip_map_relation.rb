class TipMapRelation < ActiveRecord::Base
  belongs_to :tip
  belongs_to :map
end
