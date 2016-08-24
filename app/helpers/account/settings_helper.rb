module Account::SettingsHelper
  def render_user_avatar(user, size = :thumb)
    if user.avatar.present?
      render_user_avatar_from_upload(user, size)
    else
      render_user_avatar_from_gravatar(user, size)
    end
  end

  def render_user_avatar_from_upload(user, size)
    case size
    when :tiny
      image_tag(user.avatar.thumb, width: 30, height: 30, class: "image-circle")
    when :thumb
      image_tag(user.avatar.thumb, width: 90, height: 90)
    end
  end

  def render_user_avatar_from_gravatar(user, size)
    case size
    when :tiny
      gravatar_tag(user.email, size: 90, default: avatar_url)
    when :thumb
      gravatar_tag(user.email, size: 90, default: avatar_url)
    end
  end
end
