class Account::CoursesController < AccountController
  def index
    @courses = current_user.enrolled_courses
    drop_breadcrumb "我的课程", account_courses_path
    set_page_title "我的课程"
  end
  
  protected

  def set_breadcrumbs
    @breadcrumbs = [view_context.link_to("My Account", "/account/courses")]
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
