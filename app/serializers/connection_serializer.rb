class ConnectionSerializer < ActiveModel::Serializer
  attributes  :provider, :identity
  has_many :stats
end
