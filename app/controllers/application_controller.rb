class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def stored_location_for(resource)
    nil
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
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
