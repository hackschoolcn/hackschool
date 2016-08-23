class Admin::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :require_is_admin
  before_action :get_chapter_params, only: [:index, :new, :edit, :create, :update, :destroy]

  def index
    @posts = @chapter.posts
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @course = @chapter.course
    @post.chapter = @chapter
    @post.course = @course
    if @post.save
      redirect_to admin_course_chapters_path(@course), notice: "创建成功"
    else
      render :new
    end
  end

  def update
    @course = @chapter.course
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_course_chapters_path(@course), notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @course = @chapter.course
    @post.destroy
    redirect_to  admin_course_chapters_path(@course), alert: "Deleted"
  end


  def publish
    @post = Post.find(params[:id])
    @post.publish!
    redirect_to :back
  end

  def hide
    @post = Post.find(params[:id])
    @post.hide!
    redirect_to :back
  end

  private

  def get_chapter_params
    @chapter = Chapter.find(params[:chapter_id])
  end

  def post_params
    params.require(:post).permit(:title, :article)
  end
end
