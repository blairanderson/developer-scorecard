module ApplicationHelper

  def preview_path(user)
    assets_path(anchor: "/u/#{user.nickname}")
  end

  def t(translation, options={})
    I18n.t(translation, options)
  end
end
