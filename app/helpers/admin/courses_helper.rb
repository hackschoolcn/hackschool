module Admin::CoursesHelper
  def render_course_status(course)
    if course.hide
      content_tag(:span, "", class: :"fa fa-lock")
    else
      content_tag(:span, "", class: :"fa fa-globe")
    end
  end
end
