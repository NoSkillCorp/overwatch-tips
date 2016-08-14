class GamingObjectSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :image_src, :slug, :description, :best_tip
end