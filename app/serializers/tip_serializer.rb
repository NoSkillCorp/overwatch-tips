class TipSerializer < ActiveModel::Serializer
  attributes :id, :category, :gaming_object, :score, :positive_score, :negative_score, :description, :created_at
end