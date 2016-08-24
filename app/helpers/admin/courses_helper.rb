module Admin::CoursesHelper
  def render_course_status(course)
    if course.is_hidden
      content_tag(:span, "", class: :"fa fa-lock")
    else
      content_tag(:span, "", class: :"fa fa-globe")
    end
  end

  def render_chapter_status(chapter)
    if chapter.is_hidden
      content_tag(:span, "", class: :"fa fa-lock")
    else
      content_tag(:span, "", class: :"fa fa-globe")
    end
  end

  def render_post_status(post)
    if post.is_hidden
      content_tag(:span, "", class: :"fa fa-lock")
    else
      content_tag(:span, "", class: :"fa fa-globe")
    end
  end
end
