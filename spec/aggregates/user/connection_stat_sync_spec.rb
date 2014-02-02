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
  describe 'syncing' do
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
    it 'attempts to fetch all stats types' do
      Stat.types.keys.each do |type|
        service.should_receive("sync_#{type.to_s}").and_return(true)
      end
      service.fetch
    end
  end
end