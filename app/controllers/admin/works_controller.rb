class Admin::WorksController < AdminController

  def index
    if params[:course_id]
      @course = Course.find(params[:course_id])
    end
    @courses = Course.all
    drop_breadcrumb "Works"
  end

end
