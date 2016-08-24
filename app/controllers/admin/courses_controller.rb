class Admin::CoursesController < AdminController
  def index
    @courses = Course.recent
    drop_breadcrumb "Courses"
  end

  def show
    @course = Course.find(params[:id])
    @users = @course.enrolled_users
  end

  def new
    @course = Course.new
    drop_breadcrumb "新增课程"
  end

  def edit
    @course = Course.find(params[:id])
    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb @course.title
    drop_breadcrumb "编辑课程"
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path, notice: "Success"
    else
      render :new
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_path alert: "Course Deleted"
  end

  def publish
    @course = Course.find(params[:id])
    @course.publish!
    redirect_to :back
  end

  def hide
    @course = Course.find(params[:id])
    @course.hide!
    redirect_to :back
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :price, :is_hidden, :image, :teacher_name)
  end
end
