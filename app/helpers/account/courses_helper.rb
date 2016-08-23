module Account::CoursesHelper

  def render_my_course_task_status(course)
    all_tasks = course.tasks
    submitted_works = current_user.works.where(course_id: course.id)
    
    return "已完成 #{submitted_works.count} 个任务（共 #{all_tasks.count} 个）"
  end
end
