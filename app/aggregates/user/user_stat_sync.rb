class UserStatSync
  # work with controller before/after filter
  def self.after(controller)
    user = controller.instance_variable_get(:@user)
    new(user).fetch
  end

  def initialize(object=nil)
    @user = validate_aggregate(object)
  end

  def validate_aggregate(object)
    target = User
    raise ArgumentError, "#{self.class} requires a #{target}" unless object.is_a?(target)
    object
  end

  def fetch
    types = Stat.types.keys
    types.each{|type| self.send("sync_#{type}".to_sym)}
  end
  
  def sync_osrc
    repo = repository(:osrc)
    repo.tap do |data|
      data.event = osrc_response.parsed_response
    end
    repo.save
  end

  def osrc_response
    @response ||= HTTParty.get("http://osrc.dfm.io/#{@user.nickname}.json")
  end

  def repository(type=nil)
    raise "#{self.class} repository requires a type" if type.nil?
    @user.stats.where( type_cd: Stat.send(type) ).first_or_initialize
  end
end