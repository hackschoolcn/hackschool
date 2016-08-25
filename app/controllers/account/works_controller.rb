class Account::WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_task, only: %i(new create edit update)

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    post = @task.post
    chapter = post.chapter
    course = post.course
    @work = Work.new(work_params)
    @work.user = current_user
    @work.task = @task
    @work.course = course

    if @work.save
      redirect_to account_chapter_post_path(chapter, post), notice: "作业已提交"
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    post = @task.post
    chapter = post.chapter
    if @work.update(work_params)
      redirect_to account_chapter_post_path(chapter, post), notice: "作业编辑成功"
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to :back, alert: "作业已删除"
  end

  private

  def get_task
    @task = Task.find(params[:task_id])
  end

  def work_params
    params.require(:work).permit(:content, :image)
  end
end
