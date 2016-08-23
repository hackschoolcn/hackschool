class Account::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration, only: %i(enroll_course drop_course)
  before_action :validate_search_key, only:[:search]
  layout "user"




  def index

    @courses = current_user.enrolled_courses
  end

  def enroll_course
    @course = Course.find(params[:id])

    if !current_user.member_of?(@course)
      current_user.enroll_course!(@course)
      flash[:notice] = "报名成功"
    else
      flash[:warning] = "您已报名该课程"
    end

    redirect_to account_courses_path
  end

  def drop_course
    @course = Course.find(params[:id])

    if current_user.member_of?(@course)
      current_user.drop_course!(@course)
      flash[:notice] = "退课成功"
    else
      flash[:warning] = "您还未报名该课程"
    end

    redirect_to account_courses_path

  end

  def search
    if @query_string.present?
      search_result = Course.ransack(@search_criteria).result(distinct: true).includes(:chapters).includes(:posts)
      @courses = search_result.paginate(page: params[:page], per_page:20)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_description_or_answers_content_cont: query_string }
  end

end
