require 'spec_helper'

describe UsersController do
  describe 'GET #show' do
    it 'find all the connections for a given identity' do
      connection = create(:connection)
      get :show, id: connection.identity
      expect( assigns(:connections) ).to eq [connection]
    end
  end

  describe 'GET #provider' do
    it 'finds the connection for a given identity and provider' do
      connection = create(:connection, user_id: nil)
      get :provider, id: connection.identity.parameterize, provider: connection.provider
      expect( assigns(:connection) ).to eq connection
      expect( assigns(:connection) ).to be_valid
    end
  end

end