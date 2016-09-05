class Account::WorksController < AccountController
  before_action :find_task, only: %i(new create edit update)
  before_action :find_work, only: %i(show edit update destroy)

  def show
    @work = Work.find(params[:id])
  end

  def new
    @course = @task.course
    @work = Work.new
    session[:course_id] = params[:course_id] # 记录来自哪个页面\
    drop_breadcrumb "课程作业", account_course_assignments_path(@course)
    drop_breadcrumb "提交作业 - #{@task.post.title}"
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
      if session[:course_id]  # 根据记录回到原来的页面
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
    session[:course_id] = params[:course_id] # 记录来自哪个页面
  end

  def update
    @work = Work.find(params[:id])
    post = @task.post
    chapter = post.chapter
    if @work.update(work_params)
      if session[:course_id]
        course = Course.find(session[:course_id]) # 根据记录回到原来的页面
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

  def find_work
    @work = Work.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:task_id])
  end

  def work_params
    params.require(:work).permit(:content, :image)
  end
end
