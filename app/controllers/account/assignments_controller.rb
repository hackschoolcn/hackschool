class Account::AssignmentsController < AccountController
  def index
    @course = Course.find(params[:course_id])
    drop_breadcrumb "课程作业"
  end

  protected

  def set_breadcrumbs
    @course = Course.find(params[:course_id])
    @breadcrumbs = [view_context.link_to(@course.title, account_course_chapters_path(@course))]
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
