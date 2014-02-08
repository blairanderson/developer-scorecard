class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  after_action ::ConnectionStatSync, only: [:index]
  
  def index
    @user = User.includes(:keychain).where(id: current_user.id).first
    respond_to do |format|
      format.html 
      format.json { render json: @user }
    end
  end
end
