class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    chapter_id = params[:chapter_id]
    @post = Post.new(chapter_id: chapter_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_chapters_path, notice: "hahaha"
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(Post_params)
      redirect_to admin_chapters_path, notice: "hahaha"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to  admin_chapters_path, alert: "Deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :chapter_id, :article)
  end
end
