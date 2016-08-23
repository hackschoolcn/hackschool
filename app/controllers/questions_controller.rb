class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create update edit destroy)
  before_action :find_question_and_check_permission, only: %i(edit update destroy)

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
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, alert: "讨论组已删除"
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
