module Admin::UsersHelper
  def render_user_status(user)
    if user.is_admin
      content_tag(:span, "", class: "fa fa-toggle-on")
    else
      content_tag(:span, "", class: "fa fa-toggle-off")
    end
  end
end
