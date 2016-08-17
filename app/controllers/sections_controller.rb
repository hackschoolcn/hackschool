class SectionsController < ApplicationController
  # def index
  #   @sections = @course.sections
  # end

  def show
    @section = @course.sections.find(params[:id])
  end
end
