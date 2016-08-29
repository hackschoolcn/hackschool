class Admin::FaqsController < AdminController
  before_action :find_course, only: %i(index new edit create update destroy)
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @faqs = @course.faqs
  end

  def new
    @faq = Faq.new
  end

  def show
  end

  def edit
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
  if @faq.update(faq_params)
    redirect_to  admin_course_faqs_path(@course), notice: "Updated Success"
  else
    render :edit
  end
end

  def destroy
    @faq.destroy
    redirect_to admin_course_faqs_path(@course), alert: "Deleted"
  end

  private

  def find_params
    @faq = Faq.find(params[:id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def faq_params
    params.require(:faq).permit(:title, :description)
  end
end
