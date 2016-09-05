class Account::FaqsController < AccountController
  before_action :find_course, only: %i(index)

  def index
    @faqs = @course.faqs
    drop_breadcrumb "课程 FAQ"
  end

  def show
    @faq = Faq.find(params[:id])
  end

  protected

  def set_breadcrumbs
    @course = Course.find(params[:course_id])
    @breadcrumbs = [view_context.link_to(@course.title, account_course_chapters_path(@course))]
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def faq_params
    params.require(:faq).permit(:title, :description)
  end
end
