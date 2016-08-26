class Account::QuestionsController < AccountController
  before_action :authenticate_user!, only: %i(new create update edit destroy)
  before_action :find_question, only: %i(show show edit update destroy)
  before_action :find_course, only: %i(index show new edit create update destroy)
  before_action :validate_search_key, only:[:search]

  def index
    @questions = @course.questions
    drop_breadcrumb "课程讨论区"
  end

  def new
    @question = Question.new
  end

  def show
    @answers = @question.answers.recent
  end

  def edit
    @question = Question.find(params[:id])
    if current_user != @question.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.course = @course

    if @question.save
      redirect_to account_course_questions_path(@course)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to account_course_questions_path(@course), notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to :back, alert: "提问已删除"
    if current_user != @question.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def search
    if @query_string.present?
      search_result = Question.ransack(@search_criteria).result(distinct: true).includes(:answers)
      @questions = search_result.paginate(page: params[:page], per_page:20)
    else
      redirect_to :back  
    end
  end

  
  # protected
  protected

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_description_or_answers_content_cont: query_string }
  end

  def set_breadcrumbs
    @course = Course.find(params[:course_id])
    @breadcrumbs = [view_context.link_to(@course.title, account_course_chapters_path(@course))]
  end

  def drop_breadcrumb(title = nil, url = nil)
    title ||= @page_title

    if title && url
      @breadcrumbs.push("<a href='#{url}'>#{title}</a>".html_safe)
    elsif title
      @breadcrumbs.push(title.to_s.html_safe)
    end
  end

  # private
  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
