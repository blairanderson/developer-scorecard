require 'spec_helper'

describe DashboardsController do
  subject{ response }

  describe 'GET #index' do
    let(:user) { create(:user) }

    before do
      sign_in :user, user
      get :index
    end
    it { should render_template :index }
    it { should be_success }
    it "assigns the current_user" do
      expect( assigns(:user) ).to eq user
    end
  end
end
