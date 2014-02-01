class DashboardsController < UsersController
  def index
    ::UserStatSync.new(current_user).fetch
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
      # ruby_user: User.ruby.take(3),
      # javascript_user: User.javascript.take(3),
      # python_user: User.python.take(3),
    }
  end
end
