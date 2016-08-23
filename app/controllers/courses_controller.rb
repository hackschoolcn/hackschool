class CoursesController < ApplicationController
  layout "course"
  def index
    @courses = Course.published
  end

  def show
    @course = Course.find(params[:id])
  end

  def test
  end


end
