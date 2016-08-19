class Account::ChaptersController < ApplicationController
  before_action :authenticate_user!
  
  def index

      @course = Course.find(params[:course_id])
      @chapters = @course.chapters

  end

end
