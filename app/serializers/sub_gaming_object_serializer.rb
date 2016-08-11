#Same serializer, but without the best tip, to prevent circular references
class SubGamingObjectSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :image_src, :slug, :description
end