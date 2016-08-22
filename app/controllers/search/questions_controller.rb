class Search::QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_question_and_check_permission, only: [:edit, :update, :destroy]
  before_action :validate_search_key, only:[:search]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.recent
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to search_questions_path
    else
      render :new
    end
  end

  def update

    if @question.update(question_params)
      redirect_to search_questions_path, notice: 'Update Success'
    else
      render :edit
    end
  end

  def destroy

    @question.destroy
    redirect_to search_questions_path, alert: '讨论组已删除'
  end

  def search
    if @query_string.present?
      search_result = Question.ransack(@search_criteria).result(distinct: true).includes(:answers)
      @questions = search_result.paginate(page: params[:page], per_page:20)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_description_or_answers_content_cont: query_string }
  end

  private

  def find_question_and_check_permission
    @question = Question.find(params[:id])
    @question.save
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
