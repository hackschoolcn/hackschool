class Search::CoursesController < ApplicationController
  before_action :validate_search_key, only:[:search]

  def index
    @courses = Course.published
  end

  def search
    if @query_string.present?
      search_result = Course.ransack(@search_criteria).result(distinct: true)
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
