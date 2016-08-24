class CoursesController < ApplicationController
  before_action :validate_search_key, only: [:search]
  layout "course"

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def test
  end

  def search
    if @query_string.present?
      search_result = Course.ransack(@search_criteria).result(distinct: true)
      @courses = search_result.paginate(page: params[:page], per_page: 20)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_description_cont: query_string }
  end
end
