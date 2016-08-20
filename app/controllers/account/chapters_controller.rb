class Account::ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration
  
  def index
      @course = Course.find(params[:course_id])

      if @course.is_hidden
        flash[:warning] = "This Post is archived"
        redirect_to root_path
      end
      
      @chapters = @course.chapters.where(is_hidden: false)
  end

end
