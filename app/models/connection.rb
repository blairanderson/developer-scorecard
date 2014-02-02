class Connection < ActiveRecord::Base
  as_enum :provider, [:github]

  belongs_to :user, touch: true
  has_many :stats, dependent: :destroy
end
