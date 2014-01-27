require 'spec_helper'

describe Keychain do
  describe 'validations' do
    it { should validate_presence_of :api_token }
    it { should validate_presence_of :api_secret }
    it { should validate_presence_of :oauth_secret }
    it { should validate_presence_of :oauth_token }
  end

  describe 'associations' do
    it { should belong_to :user}
  end

  describe '.build_from_oauth' do
    it 'creates a key' do
      keychain = Keychain.build_from_oauth(omni_auth_attributes)
      expect(keychain).to be_valid
    end
  end
end
