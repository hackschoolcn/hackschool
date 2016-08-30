module Admin::WorksHelper
  def render_users_that_havent_submitted(task)
    all_users_course = []
    users_have_submitted = []

    task.course.enrolled_users.each do |user|
      all_users_course << user.email
    end

    task.works.each do |work|
      users_have_submitted << work.user.email
    end

    users_havent_submitted = all_users_course - users_have_submitted
    users_havent_submitted.join " ,  "
  end
end
