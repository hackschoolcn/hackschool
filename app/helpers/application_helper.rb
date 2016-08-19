module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:db) if time
  end

<<<<<<< HEAD
  def render_course_description(course)
    course.description.to_markdown
=======
  def render_markdown_text(text)
    text.to_markdown
>>>>>>> origin/develop
  end
end
