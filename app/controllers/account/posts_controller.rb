class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def show
    @post = Post.find(params[:id])

    if @post.is_hidden
      flash[:warning] = "This Post is archived"
      redirect_to root_path
    end
  end

end
