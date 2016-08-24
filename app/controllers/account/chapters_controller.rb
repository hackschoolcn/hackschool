class Account::ChaptersController < AccountController
  before_action :authenticate_user!
  before_action :check_subscription_expiration
  before_action :validate_search_key, only: [:search]

  layout "application"

  def index
    @course = Course.find(params[:course_id])

    if @course.is_hidden?
      flash[:warning] = "此课程没有开课"
      redirect_to root_path
    end

    if current_user.enrolled_courses.include?(@course)
      @chapters = @course.chapters.where(is_hidden: false)
    else
      flash[:warning] = "请先报名参加该课程"
      redirect_to course_path(@course)
    end
  end

  def search
    if @query_string.present?
      search_result = Post.ransack(@search_criteria).result(distinct: true).includes(:chapter)
      @posts = search_result.paginate(page: params[:page], per_page: 20)
    else
      redirect_to :back
    end
  end

  protected

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { article_cont: query_string, chapter_is_hidden_eq: false }
  end
end
