module CoursesHelper
  def render_course_teacher_name(course)
    course.teacher_name
  end

  def render_course_description(course)
    course.description.to_markdown
  end

  def render_course_image(course)
    image_tag course.image.thumb
  end

  def render_course_price(_course)
    "$ #{@course.price}"
  end
end
