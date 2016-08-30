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
      @breadcrumbs.push(view_context.link_to(title, url))
    elsif title
      @breadcrumbs.push(title)
    end
  end
end
