module ApplicationHelper
  def avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url
    end
  end
end
