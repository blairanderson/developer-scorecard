require 'spec_helper'

describe UserStatSync do
  [{}, [], "string", Stat.new].each do |invalid_object|
    it "requires a user, does not allow a #{invalid_object.class}" do
      expect{ UserStatSync.new(invalid_object) }.to raise_error(ArgumentError, 'UserStatSync requires a User')
    end
  end

  let(:user) { create(:user) }
  let(:service) { UserStatSync.new user }
  describe '#fetch' do
    it 'attempts to fetch all stats types' do
      Stat.types.keys.each do |type|
        service.should_receive("sync_#{type.to_s}").and_return(true)
      end
      service.fetch
    end
  end

  describe 'syncing' do
    describe '#osrc' do
      it 'creates an event' do
        VCR.use_cassette('blairanderson_osrc') do
          user = create(:user, nickname: 'blairanderson')
          service = UserStatSync.new user
          expect{ service.fetch }.to change(user.stats.reload, :count).by(1)
        end
      end

      it 'fetches some real data' do
        VCR.use_cassette('blairanderson_osrc') do
          user = create(:user, nickname: 'blairanderson')
          service = UserStatSync.new user
          service.fetch
          stat = user.reload.stats.first
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

end