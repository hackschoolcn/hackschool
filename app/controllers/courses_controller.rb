class CoursesController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:member_confirm_enroll]
  before_action :check_enrolled_status, only: %i(enroll member_confirm_enroll)
  layout "course"

  def index
    @courses = Course.all.where(is_hidden: false)
  end

  def show
    @course = Course.find(params[:id])
  end

  def test
  end

  def search
    if @query_string.present?
      search_result = Course.where(is_hidden: false).ransack(@search_criteria).result(distinct: true)
      @courses = search_result.paginate(page: params[:page], per_page: 20)
    else
      redirect_to :back
    end
  end

  def enroll
    if current_user
      if current_user.is_valid_subscriber?
        render :confirm_enroll
      else
        render :enroll_with_user
      end

    else

      render :enroll_with_signup_form
    end
  end

  def member_confirm_enroll
    if current_user.is_valid_subscriber?
      current_user.enroll_course!(@course)
      flash[:notice] = "报名成功"
      redirect_to account_courses_path
    else
      render :enroll_with_user
    end
  end

  protected

  def check_enrolled_status
    @course = Course.find(params[:id])
    if current_user && current_user.member_of?(@course)
      flash[:warning] = "您已报名该课程"
      redirect_to account_courses_path
    end
  end

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_description_cont: query_string }
  end
end
