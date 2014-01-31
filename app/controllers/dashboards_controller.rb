class DashboardsController < UsersController
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
      busy_user: User.order(sign_in_count: :desc).first,
      popular_user: User.order(last_sign_in_at: :desc).first,
      # ruby_user: User.ruby.take(3),
      # javascript_user: User.javascript.take(3),
      # python_user: User.python.take(3),
    }
  end
end
