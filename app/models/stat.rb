class Stat < ActiveRecord::Base
  serialize :event, Hash

  validates_presence_of :connection_id
  validates_presence_of :type_cd
  validates_presence_of :event
  validates_numericality_of :connection_id
  validates_numericality_of :type_cd

  as_enum :type, [:github_osrc]

  belongs_to :connection, touch: true
end
