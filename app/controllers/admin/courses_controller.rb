class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @users = @course.enrolled_users
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
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
