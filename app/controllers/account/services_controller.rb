class Account::ServicesController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  def index
    @services = current_user.services.all
  end
end
