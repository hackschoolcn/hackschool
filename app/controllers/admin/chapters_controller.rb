class Admin::ChaptersController < ApplicationController

  before_action :authenticate_user!
  before_action :get_course_params, only: [:index, :new, :edit, :create, :update, :destroy]

  def index
    @chapters = @course.chapters
  end

  def new
    @chapter = Chapter.new
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.course = @course
    if @chapter.save!
      redirect_to admin_course_chapters_path(@course), notice: "章节创建成功"
    else
      render :new
    end
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      redirect_to admin_course_chapters_path(@course), notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to  admin_course_chapters_path(@course), alert: "Deleted"
  end

  private

  def get_course_params
    @course = Course.find(params[:course_id])
  end

  def chapter_params
    params.require(:chapter).permit(:chapter)
  end

end
