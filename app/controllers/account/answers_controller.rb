class Account::AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @course = @question.course
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user

    if @answer.save
      redirect_to account_course_question_path(@course, @question)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
