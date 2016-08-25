class Admin::FaqsController < ApplicationController
  before_action :find_course, only: %i(index new edit create update destroy)

  def index
    @faqs = @course.faqs
  end

  def new
    @faq = Faq.new
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def create
    @faq = Faq.new(faq_params)
    @faq.course = @course
  if @faq.save!
    redirect_to  admin_course_faqs_path(@course), notice: "Created Success"
  else
    render :new
  end
end

  def update
    @faq = Faq.find(params[:id])
  if @faq.update(faq_params)
    redirect_to  admin_course_faqs_path(@course), notice: "Updated Success"
  else
    render :edit
  end
end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to admin_course_faqs_path(@course), alert: "Deleted"
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def faq_params
    params.require(:faq).permit(:title, :description)
  end
end
