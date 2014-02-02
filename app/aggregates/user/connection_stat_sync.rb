class ConnectionStatSync
  attr_reader :connection, :user
  # work with controller before/after filter
  def self.after(controller)
    user = controller.instance_variable_get(:@user)
    new(user.provider, user.nickname).fetch
  end

  def initialize(provider=nil, identity=nil)
    @provider = validate_provider provider
    @identity = identity
    @connection = Connection.where(identity: @identity, provider_cd: Connection.send(@provider) ).first_or_create
    @user = User.where(nickname: @identity, provider: @provider).first
    @user.connections << @connection if @user
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
    @response ||= HTTParty.get("http://osrc.dfm.io/#{connection.identity}.json")
  end

  def repository(type=nil)
    raise "#{self.class} repository requires a type" if type.nil?
    connection.stats.where( type_cd: Stat.send(type) ).first_or_initialize
  end

  def validate_provider(provider)
    unless Connection.providers.keys.include?(provider.to_sym)
      raise ArgumentError, "#{self.class} requires a valid provider"
    end
    provider
  end

  def validate_nil(object)
    raise "#{self.class} missing input" if type.nil?
  end
end