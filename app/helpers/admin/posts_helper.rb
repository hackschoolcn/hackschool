module Admin::PostsHelper
  def render_students_homework_submitted_status(task)
    submitted_works = task.works
    all_enrolled_users = task.course.enrolled_users

    "【已有 #{submitted_works.count} 人提交（共 #{all_enrolled_users.count} 人）】"
  end
end
