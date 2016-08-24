class AccountController < ApplicationController
  before_action :authenticate_user!
  before_action :set_breadcrumbs
  layout "user"

  def set_breadcrumbs
    @breadcrumbs = [view_context.link_to("My Account", "/account/courses")]
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
