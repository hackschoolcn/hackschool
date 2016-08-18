class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.published
  end

  def show
    @order = current_user.orders.last
    @course = Course.find(params[:id])
  end
end
