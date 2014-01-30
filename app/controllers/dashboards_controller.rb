class DashboardsController < UsersController
  def index
    @user = User.includes(:stats, :keychain).where(id: current_user.id).first
  end
end
