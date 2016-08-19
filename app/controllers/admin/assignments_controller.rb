class Admin::AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
end
