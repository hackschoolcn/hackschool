module Account::PostsHelper
  def render_prev_next_buttons(post)
    may_prev = post.may_prev?
    may_next = post.may_next?
    render partial: "account/posts/prev_next_buttons", locals: { may_prev: may_prev, may_next: may_next }
  end

  def render_work_operate_buttons(task)
    works = task.works.where(user_id: current_user.id)
    if works.count > 0
      render partial: "account/works/homework_operation_buttons", locals: { task: task, work: works[0] }
    else
      link_to("提交作业", new_account_task_work_path(task), class: "btn btn-xs btn-success pull-right")
    end
  end

  def render_work_operate_buttons_from_all_tasks_view(task, course)
    works = task.works.where(user_id: current_user.id)

    if works.count > 0
      link_to("编辑作业", edit_account_task_work_path(task_id: task.id, id: works[0].id, course_id: course.id), class: "btn btn-xs btn-primary pull-right")
    else
      link_to("提交作业", new_account_task_work_path(task_id: task.id, course_id: course.id), class: "btn btn-xs btn-success pull-right")
    end
  end

end
