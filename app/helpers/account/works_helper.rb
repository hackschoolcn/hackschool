module Account::WorksHelper

  def render_work_submit_status(task)
    works = task.works.where(user_id: current_user.id)
    if works.count > 0
      render partial: "account/works/homework_operation_buttons", locals: {task: task, work: works[0]}
    else
      link_to("提交作业", new_account_task_work_path(task), class: "btn btn-xs btn-success pull-right")
    end
  end

end
