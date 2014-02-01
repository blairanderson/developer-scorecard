class UserStatSync

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
    @response = HTTParty.get("http://osrc.dfm.io/#{@user.nickname}.json")
    repo = repository(:osrc)
    repo.tap do |data|
      data.event = @response.parsed_response
    end
    repo.save
  end

  def repository(type=nil)
    raise "#{self.class} repository requires a type" if type.nil?
    @user.stats.where( type_cd: Stat.send(type) ).first_or_initialize
  end
end