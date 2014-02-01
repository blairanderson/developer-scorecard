class DashboardsController < UsersController
  after_action ::UserStatSync, only: [:index]

  def index
    @user = User.includes(:stats, :keychain).where(id: current_user.id).first
  end

  def show
    @user = User.includes(:stats, :keychain).where(nickname: params[:id]).first
    render json: @user, meta: meta, meta_key: 'meta_object'
  end

  def meta
    {
      total_users: User.count,
      busy_users: User.order(sign_in_count: :desc).take(3),
      popular_users: User.order(last_sign_in_at: :desc).take(3),
      # put more cool meta-data here
    }
  end
end
