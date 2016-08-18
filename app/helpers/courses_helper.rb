module CoursesHelper
  def render_course_teacher_name(course)
    course.teacher_name
  end

  def render_course_description(course)
    course.description.to_markdown
  end
end
