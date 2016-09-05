class Admin::CoursesController < AdminController
  before_action :find_course, only: %i(show edit update destroy publish hide edit_course)

  def index
    @courses = Course.recent
    drop_breadcrumb "Courses"
  end

  def show
    @users = @course.enrolled_users
    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb @course.title + "- 课程详情页"
    drop_breadcrumb
  end

  def new
    @course = Course.new
    drop_breadcrumb "新增课程"
  end

  def edit
    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb @course.title
    drop_breadcrumb "编辑首页课程信息"
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path, notice: "课程创建成功"
    else
      render :new
    end
  end

  def update
    if session[:edit_course_detail] # 根据记录回到原来的页面
      session[:edit_course_detail] = false

      if @course.update(course_params)
      redirect_to admin_course_path(@course), notice: "课程更新成功"
      else
        render :edit
      end

    else

      if @course.update(course_params)
      redirect_to admin_courses_path, notice: "课程更新成功"
      else
        render :edit
      end

    end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_path, alert: "课程已删除"
  end

  def publish
    @course.publish!
    redirect_to :back
  end

  def hide
    @course.hide!
    redirect_to :back
  end


  def dismiss_course
    @course = Course.find(params[:id])

    @course.dismiss!

    flash[:warning] = "#{@course.title} 已结课"
    redirect_to :back
  end


  def start_course
    @course = Course.find(params[:id])

    @course.start!
    flash[:notice] = "#{@course.title} 已开课"
    redirect_to :back
  end


  def edit_course
    if params[:edit_course_detail]
      session[:edit_course_detail] = true
    end
    drop_breadcrumb @course.title, admin_course_path(@course)
    drop_breadcrumb "编辑课程详情页"
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:faq, :title, :description, :price, :is_hidden, :image, :teacher_name, :hero_image, :teacher_image, :about_teacher, :one_sentence_summary, :hero_title)
  end
end
