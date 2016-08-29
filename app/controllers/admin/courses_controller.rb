class Admin::CoursesController < AdminController
  before_action :find_course, only: %i(show edit update destroy publish hide edit_course)

  def index
    @courses = Course.recent
    drop_breadcrumb "Courses"
  end

  def show
    @users = @course.enrolled_users
  end

  def new
    @course = Course.new
    drop_breadcrumb "新增课程"
  end

  def edit
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
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_path, alert: "Course Deleted"
  end

  def publish
    @course.publish!
    redirect_to :back
  end

  def hide
    @course.hide!
    redirect_to :back
  end

  def edit_course
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:faq, :title, :description, :price, :is_hidden, :image, :teacher_name, :hero_image, :teacher_image, :about_teacher, :one_sentence_summary, :hero_title)
  end
end
