class CoursesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!

=======
>>>>>>> origin/develop
  def index
    @courses = Course.published
  end

  def show
<<<<<<< HEAD
    @order = current_user.orders.last
=======
>>>>>>> origin/develop
    @course = Course.find(params[:id])
  end
end
