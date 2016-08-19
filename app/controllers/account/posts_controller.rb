class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def show
    @post = Post.find(params[:id])
  end

end
