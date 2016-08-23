class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def show
    @chapter = Chapter.find(params[:chapter_id])
    @post = Post.find(params[:id])

    if @post.is_hidden? || @chapter.is_hidden?
      flash[:warning] = "The content is archived"
      redirect_to root_path
    end
  end

  def prev
    @post = Post.find(params[:id])
    course = @post.course

    post = @post.may_prev? || @post
    redirect_to account_chapter_post_path(post.chapter, post)
  end

  def next
    @post = Post.find(params[:id])
    course = @post.course

    post = @post.may_next? || @post
    redirect_to account_chapter_post_path(post.chapter, post)
  end
end
