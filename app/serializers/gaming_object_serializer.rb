class GamingObjectSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :slug, :description, :best_tip
end