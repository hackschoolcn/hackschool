class Account::WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_task, only: %i(new create edit update)

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
    session[:course_id] = params[:course_id]  # 记录来自哪个页面
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
      if session[:course_id]
        course = Course.find(session[:course_id])  # 根据记录回到原来的页面
        session[:course_id] = false
        redirect_to account_course_assignments_path(course), notice: "作业已提交"
      else
        redirect_to account_chapter_post_path(chapter, post), notice: "作业已提交"
      end
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
    session[:course_id] = params[:course_id]  # 记录来自哪个页面
  end

  def update
    @work = Work.find(params[:id])
    post = @task.post
    chapter = post.chapter
    if @work.update(work_params)
      if session[:course_id]
        course = Course.find(session[:course_id])  # 根据记录回到原来的页面
        session[:course_id] = false
        redirect_to account_course_assignments_path(course), notice: "作业编辑成功"
      else
        redirect_to account_chapter_post_path(chapter, post), notice: "作业编辑成功"
      end
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
