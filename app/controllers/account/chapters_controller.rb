class Account::ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration
  
  def index
      @course = Course.find(params[:course_id])
      @chapters = @course.chapters
  end

end
