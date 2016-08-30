class Account::FaqsController < ApplicationController
  before_action :find_course, only: %i(index)

  def index
    @faqs = @course.faqs
  end

  def show
    @faq = Faq.find(params[:id])
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def faq_params
    params.require(:faq).permit(:title, :description)
  end
end
