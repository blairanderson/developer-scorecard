require 'spec_helper'

describe ConnectionStatSync do
  it "requires a valid provider" do
    invalid_object = OpenStruct.new(provider: 'taco', nickname: 'taco2')
    expect{ ConnectionStatSync.new(invalid_object.provider, invalid_object.nickname) }.to raise_error(ArgumentError, 'ConnectionStatSync requires a valid provider')
  end

  let(:user) { create(:user) }
  let(:service) { ConnectionStatSync.new user.provider, user.nickname }

  describe '#initialize' do
    it 'creates a connection' do
      connection = service.connection
      expect(connection.user).to eq user
    end

    it 'finds a connection' do
      connection = create(:connection, provider_cd: Connection.send(user.provider), identity: user.nickname, user_id: nil)
      service = ConnectionStatSync.new user.provider, user.nickname
      expect(service.user).to eq  connection.reload.user
    end
  end

  let(:events) { Stat.types.keys }

  Connection.providers.keys.each do |provider|
    it "requires instance method ##{provider}_event_urls to properly include API urls" do
      expect{ service.send("#{provider}_event_urls") }.to_not raise_error
    end

    it "##{provider}_event_urls are missing from Stat.types enum list" do
      service.send("#{provider}_event_urls").each do |type, url|
        expect(Stat.types.keys).to include(type)
      end
    end
  end


  describe 'fetching' do
    describe '#osrc' do
      it 'creates an event' do
        VCR.use_cassette('mojombo_osrc') do
          conn = create(:connection, identity: 'mojombo', user_id: nil)
          service = ConnectionStatSync.new conn.provider, conn.identity
          expect{ service.fetch }.to change(conn.stats.reload, :count).by(1)
        end
      end

      it 'fetches some real data' do
        VCR.use_cassette('mojombo_osrc') do
          user = create(:user, nickname: 'mojombo')
          service = ConnectionStatSync.new 'github', user.nickname
          service.fetch
          stat = service.connection.reload.stats.first
          expect(stat).to be_valid
          expect(stat.event.keys).to eq [
            "connected_users", 
            "gravatar", 
            "name", 
            "repositories", 
            "similar_users", 
            "timezone", 
            "usage",
            "username"]
        end
      end
    end
  end

  describe '#fetch' do
    it 'attempts to fetch all stats types for the given provider' do
      keys = service.send("#{service.provider}_event_urls").each do |event, url|
        service.should_receive(:sync).with(event.to_sym, url).and_return(true)
      end
      service.fetch
    end
  end
end