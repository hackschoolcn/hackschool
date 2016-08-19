class Account::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def index
    @courses = Course.all
  end

end
