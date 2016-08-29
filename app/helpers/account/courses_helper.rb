module Account::CoursesHelper
  def render_my_course_task_status(course)
    all_tasks = course.tasks
    submitted_works = current_user.works.where(course_id: course.id)

    "已完成 #{submitted_works.count} 个任务（共 #{all_tasks.count} 个）"
  end

  def render_progress_bar(course)
    percent = number_with_precision(current_user.works.where(course_id: course.id).count.to_f / course.tasks.count.to_f * 100, precision: 1)
    percentage = percent.to_s + "%"
    if percent.to_f > 99.7.to_f
      content_tag :div, class: "progress" do
        content_tag :div, class: %w(progress-bar progress-bar-success), role: "progressbar", 'aria-valuenow': percent.to_s, 'aria-valuemin': "0", 'aria-valuemax': "100", 'style': "width: "+ percentage + ";min-width:2em;"  do
           percentage + " 已全部完成"
        end
      end
    else
      content_tag :div, class: "progress" do
        content_tag :div, class: %w(progress-bar progress-bar-striped active), role: "progressbar", 'aria-valuenow': percent.to_s, 'aria-valuemin': "0", 'aria-valuemax': "100", 'style': "width: "+ percentage + ";min-width:2em;"  do
           percentage
        end
      end
    end

  end

end
