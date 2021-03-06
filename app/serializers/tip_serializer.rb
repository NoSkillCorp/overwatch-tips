class TipSerializer < ActiveModel::Serializer
  attributes :id, :category, :playing_sentence, :score, :positive_score, :negative_score, :description, :created_at
  belongs_to :gaming_object, serializer: SubGamingObjectSerializer
end