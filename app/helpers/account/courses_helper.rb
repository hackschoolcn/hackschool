module Account::CoursesHelper
  def render_my_course_task_status(course)
    all_tasks = course.tasks
    submitted_works = current_user.works.where(course_id: course.id)

    "已完成 #{submitted_works.count} 个任务（共 #{all_tasks.count} 个）"
  end

  def render_progress(percent)
    percent = percent.to_s + "%"
    content_tag :div, class: "progress" do
      content_tag :div, class: %w(progress-bar progress-bar-danger progress-bar-striped), role: "progressbar", 'aria-valuenow': percent, 'aria-valuemin': "0", 'aria-valuemax': "100", 'style': "width: "+ percent + ";min-width:2em;"  do
        content_tag(:span, percent, class: "sr-only")
        percent
      end
    end
  end

end
