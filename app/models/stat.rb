class Stat < ActiveRecord::Base
  serialize :event, Hash

  validates_presence_of :user_id
  validates_presence_of :type_cd
  validates_presence_of :event
  validates_numericality_of :user_id
  validates_numericality_of :type_cd

  as_enum :type, [:signup, :snapshot, :osrc]
  belongs_to :user, touch: true


private
  def event_source
    OpenStruct.new(event)
  end
end
