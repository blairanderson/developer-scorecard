require 'spec_helper'

describe User do
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
  end
end
