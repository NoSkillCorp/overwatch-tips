#Same serializer, but without the best tip, to prevent circular references
class SubTipSerializer < ActiveModel::Serializer
  attributes :id, :category, :playing_sentence, :score, :positive_score, :negative_score, :description, :created_at
end