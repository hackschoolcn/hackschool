class Admin::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  before_action :get_post, only: [:new, :create, :edit, :update]

  def index
    
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.post = @post
    @course = @post.course
    if @task.save
      redirect_to admin_course_chapters_path(@course), notice: "作业添加成功"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @chapter = @post.chapter
    if @task.update(task_params)
      redirect_to admin_chapter_post_path(@chapter, @post), notice: "作业编辑成功"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to  :back, alert: "作业已删除"
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def task_params
    params.require(:task).permit(:description, :due_time)
  end
end
