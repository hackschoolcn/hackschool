class Account::CoursesController < AccountController

  def index
    @courses = current_user.enrolled_courses
    drop_breadcrumb "我的课程", account_courses_path
  end

  def enroll_course
    @course = Course.find(params[:id])

    if !current_user.member_of?(@course)
      current_user.enroll_course!(@course)
      flash[:notice] = "报名成功"
    else
      flash[:warning] = "您已报名该课程"
    end

    if currnet_user.is_valid_subscriber?
      flash[:notice] = "请先选择你的订阅套餐"
      redirect_to plans_path
    else
      redirect_to account_courses_path
    end
  end

  def drop_course
    @course = Course.find(params[:id])

    if current_user.member_of?(@course)
      current_user.drop_course!(@course)
      flash[:notice] = "退课成功"
    else
      flash[:warning] = "您还未报名该课程"
    end

    redirect_to account_courses_path
  end

  protected

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
