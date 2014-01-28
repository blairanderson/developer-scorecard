class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :omniauthable, omniauth_providers: [:github]

  validates_presence_of :provider 
  validates_presence_of :uid 
  validates_presence_of :email
  validates_presence_of :nickname
  validates_presence_of :encrypted_password 
  validates_presence_of :sign_in_count 

  has_one :keychain, dependent: :destroy
  has_many :stats, dependent: :destroy

  def self.find_for_github_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.keychain ||= Keychain.build_from_oauth(auth)
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      user.image = auth.info.image
      user.save!
    end
  end
end
