class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  before_action :set_breadcrumbs
  layout "admin"

  def set_breadcrumbs
    @breadcrumbs = [view_context.link_to("Admin", "/admin/courses")]
  end

  def drop_breadcrumb(title = nil, url = nil)
    title ||= @page_title

    if title && url
      @breadcrumbs.push("<a href='#{url}'>#{title}</a>".html_safe)
    elsif title
      @breadcrumbs.push(title.to_s.html_safe)
    end
  end
end
