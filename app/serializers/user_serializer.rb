class UserSerializer < ActiveModel::Serializer
  cached
  def cache_key
    [object]
  end
  attributes  :id,
              :provider,
              :uid,
              :name,
              :image,
              :email,
              :remember_created_at,
              :sign_in_count,
              :current_sign_in_at,
              :last_sign_in_at,
              :current_sign_in_ip,
              :last_sign_in_ip,
              :created_at,
              :updated_at,
              :nickname
  has_many :stats
  
  has_one :keychain
end
