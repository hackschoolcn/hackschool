class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
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
      redirect_to root_path, notice: "Success"
    else
      render :new
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to root_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to root_path, alert: "Course Deleted"
  end


  def publish
    @course = Course.find(params[:id])
    @course.is_hidden = false
    @course.save
    redirect_to :back
  end

  def hide
    @course = Course.find(params[:id])
    @course.is_hidden = true
    @course.save
    redirect_to :back
  end

  private
  def course_params
    params.require(:course).permit(:title, :description, :price, :is_hidden)
  end
end
