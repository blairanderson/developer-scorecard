module ApplicationHelper

  def preview_path(user)
    assets_path(anchor: "/u/#{user.nickname}")
  end
end
