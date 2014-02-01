require 'spec_helper'

describe DashboardsController do
  it 'displays a github login button' do
    visit root_path
    expect(page).to have_selector('a.login')
  end

  it 'redirects user to dashboard after login' do
    stub_omniauth_login
    visit root_path
    find('a.login').click
    expect(current_path).to eq dashboard_path
  end
end