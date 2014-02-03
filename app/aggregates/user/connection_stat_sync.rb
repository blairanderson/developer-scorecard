class ConnectionStatSync
  attr_reader :connection, :user, :provider
  # work with controller before/after filter
  def self.after(controller)
    user = controller.instance_variable_get(:@user)
    new(user.provider, user.nickname).fetch
  end

  def initialize(provider=nil, identity=nil)
    @provider = validate_provider provider
    @identity = identity
    @connection = Connection.where(identity: @identity, provider_cd: Connection.providers(@provider) ).first_or_create
    @user = User.where(nickname: @identity, provider: @provider).first
    @user.connections << @connection if @user
  end

  def github_event_urls
    {
      github_osrc:            "http://osrc.dfm.io/#{connection.identity}.json",
      # github_user:            "https://api.github.com/users/#{connection.identity}",
      # github_gists:           "https://api.github.com/users/#{connection.identity}/gists",
      # github_repos:           "https://api.github.com/users/#{connection.identity}/repos",
      # github_followers:       "https://api.github.com/users/#{connection.identity}/followers",
      # github_received_events: "https://api.github.com/users/#{connection.identity}/received_events",
    }
  end

  def fetch
    self.send("#{provider}_event_urls").each do |event, url|
     sync(event.to_sym, url)
   end
  end

private

  def sync(type, url)
    repo = repository(type)
    response = HTTParty.get(url)
    repo.tap do |data|
      data.event = EventParser.new(type).clean(response.parsed_response)
    end
    repo.save
  rescue
    puts "could not find data for #{connection.identity}"
  end

  def repository(type=nil)
    raise "#{self.class} repository requires a type" if type.nil?
    connection.stats.where( type_cd: Stat.types(type) ).first_or_initialize
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