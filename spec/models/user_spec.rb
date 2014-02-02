require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :provider }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :email }
    it { should validate_presence_of :nickname }
    it { should validate_presence_of :encrypted_password }
    it { should validate_presence_of :sign_in_count }
  end

  describe 'associations' do
    it { should have_one(:keychain).dependent(:destroy) }
    it { should have_many(:connections) }
  end

  describe '.find_for_github_oauth' do
    it 'creates a new user' do
      user = User.find_for_github_oauth(omni_auth_attributes)
      expect(user).to be_valid
    end

    it 'finds an existing user' do
      user = User.find_for_github_oauth(omni_auth_attributes)
      expect(user).to be_valid

      user2 = User.find_for_github_oauth(omni_auth_attributes)
      expect(user2).to eq user
    end

    it 'creates an api key' do
      Keychain.should_receive(:build_from_oauth).with(omni_auth_attributes)
      User.find_for_github_oauth(omni_auth_attributes)
    end

    it 'finds a connection' do
      connection = create(:connection, 
        user_id: nil, 
        provider_cd: 0, 
        identity: omni_auth_attributes.info.nickname)

      user = User.find_for_github_oauth(omni_auth_attributes)
      user_connections = user.connections
      expect(user_connections.count).to eq 1
      expect(user_connections.first).to eq connection
    end
  end
end