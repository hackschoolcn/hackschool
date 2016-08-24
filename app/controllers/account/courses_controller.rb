class Account::CoursesController < AccountController
  before_action :validate_search_key, only: [:search]

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

    if !current_user.member_expire_date || current_user.member_expire_date < Time.now
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

  def search
    if @query_string.present?
      search_result = Course.where(is_hidden: false).ransack(@search_criteria).result(distinct: true)
      @courses = search_result.paginate(page: params[:page], per_page: 20)
    else
      redirect_to :back
    end
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

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_description_or_answers_content_cont: query_string }
  end
end
