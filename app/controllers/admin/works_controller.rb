class Admin::WorksController < AdminController

  def index
    @task = Task.find(params[:task_id])
    @course = @task.course

    drop_breadcrumb "Tasks", admin_tasks_path(course_id: @course.id)
    drop_breadcrumb "Works"
  end

end
