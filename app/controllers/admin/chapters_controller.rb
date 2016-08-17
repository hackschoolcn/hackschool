class Admin::ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
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
    if @chapter.save
      redirect_to admin_chapters_path, notice: "hahaha"
    else
      render :new
    end
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      redirect_to root_path, notice: "hahaha"
    else
      render :edit
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to  admin_chapters_path, alert: "Deleted"
  end

  private

  def chapter_params
    params.require(:chapter).permit(:chapter)
  end
  # def course_params
  #   params.require(:course).permit(:title, :description, :price, :is_hidden, :image, :teacher_name)
  # end
end
