class UserSerializer < ActiveModel::Serializer
  cached

  def cache_key
    [object, object.updated_at]
  end
  attributes  :id,
              :provider,
              :nickname,
              :name,
              :uid,
              :email,
              :image,
              :remember_created_at,
              :sign_in_count,
              :current_sign_in_at,
              :last_sign_in_at,
              :current_sign_in_ip,
              :last_sign_in_ip,
              :created_at,
              :updated_at

  has_many :connections
  has_one :keychain
end
