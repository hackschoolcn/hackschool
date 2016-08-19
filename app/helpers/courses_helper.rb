module CoursesHelper
  def render_course_teacher_name(course)
    course.teacher_name
  end

<<<<<<< HEAD
  def render_course_description(course)
    course.description.to_markdown
  end
=======

>>>>>>> origin/develop

  def render_course_image(course, size = :thumb)
    case size
    when :thumb
      image_tag(course.image.thumb)
    when :medium
      image_tag(course.image.medium)
    else
      image_tag(course.image)
    end
  end

  def render_course_price(_course)
    "$ #{@course.price}"
  end
end
