class GamingObjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :type, :slug
end