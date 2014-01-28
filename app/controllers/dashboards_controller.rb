class DashboardsController < ApplicationController
  def new
  end

  def index
    @user = User.includes(:stats, :keychain).where(id: current_user.id).first
  end
end
