class ChaptersController < ApplicationController
  before_action :get_course
  before_action :authenticate_user!, only:[:index, :show]

  def get_course
    @course = Course.find(params[:course_id])
  end

  def index
    @chapters = @course.chapters
  end

  def show
    @chapter = @course.chapters.find(params[:id])
  end
end
