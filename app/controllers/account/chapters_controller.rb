class Account::ChaptersController < AccountController
  before_action :find_course
  before_action :check_enrolled_status
  before_action :validate_search_key, only: [:search]

  def index
    @course = Course.find(params[:course_id])

    if @course.hidden?
      flash[:warning] = "此课程没有开课"
      redirect_to root_path
    end

    if current_user.enrolled_courses.include?(@course)
      @chapters = @course.chapters.where(is_hidden: false)
      set_breadcrumbs
    else
      flash[:warning] = "请先报名参加该课程"
      redirect_to course_path(@course)
    end
  end

  def search
    @course = Course.find(params[:course_id])
    if @query_string.present?
      search_result = Post.where(course_id: params[:course_id], is_hidden: false).ransack(@search_criteria).result(distinct: true)
      @posts = search_result.paginate(page: params[:page], per_page: 20)
    else
      redirect_to :back
    end
  end

  protected

  def find_course
    @course = Course.find(params[:course_id])
  end

  def check_enrolled_status
    unless current_user.enrolled_courses.include?(@course)
      flash[:alert] = "您尚未报名此课程"
      redirect_to enroll_course_path(@course)
    end
  end

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

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { article_cont: query_string, chapter_is_hidden_eq: false, course_is_hidden_eq: false }
  end
end
