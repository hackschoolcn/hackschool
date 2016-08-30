class Admin::TasksController < AdminController
  before_action :find_post, only: %i(new create edit update)

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @course = @post.course
    @task.post = @post
    @task.course = @course
    if @task.save
      redirect_to admin_course_chapters_path(@course), notice: "任务添加成功"
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
      redirect_to admin_chapter_post_path(@chapter, @post), notice: "任务编辑成功"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back, alert: "任务已删除"
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def task_params
    params.require(:task).permit(:description, :due_time)
  end
end
