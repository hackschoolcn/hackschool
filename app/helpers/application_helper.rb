module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:db) if time
  end

  def render_course_description(course)
    course.description.to_markdown
  end
end
