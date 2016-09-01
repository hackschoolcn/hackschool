module Admin::WorksHelper
  def render_users_that_havent_submitted(task)
    all_users_course = []
    users_have_submitted = []

    task.course.enrolled_users.each do |user|
      all_users_course << user
    end

    task.works.each do |work|
      users_have_submitted << work.user
    end

    users_havent_submitted = all_users_course - users_have_submitted
    
    render partial: "admin/works/show_users_with_link", locals: { users_havent_submitted: users_havent_submitted }
  end
end
