class Account::ChaptersController < ApplicationController
  before_action :authenticate_user!
  
  def index

      if current_user.member_expire_date
        @course = Course.find(params[:course_id])
        @chapters = @course.chapters
      else
        flash[:warning] = "您还没购买任何课程"
    end

  end

end
